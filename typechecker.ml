open Ast

exception TypeError of myType * myType * err_location

(* SECTION Environment helpers *)

type type_environment =
 | Global_env of def list
 | Whatever of (def list) * type_environment
 
let rec type_env_of_env env = 
  let rec def_of_binding_list l = match l with
    | [] -> []
    | {name_type = a; value = e}::t -> a::(def_of_binding_list t)
  in match env with
      | Ast.Global_env (bl) -> Global_env (def_of_binding_list bl)
      | Ast.Whatever (bl, env) -> Whatever ((def_of_binding_list bl), (type_env_of_env env))
;;
 
(* lookup: string -> environment -> myType; throws Unbound *)
let rec lookup name env loc =
 let rec lookup_frame name fr =
  match fr with
   | [] -> raise (Unbound (name, loc))
   | h::tail -> (if h.name = name then h.mtype else lookup_frame name tail)
 in (match env with
     | Global_env(f) -> lookup_frame name f
     | Whatever(f,e) -> try lookup_frame name f
                        with Unbound(_) -> lookup name e loc)
;;

(* make_binding: def -> environment -> environment *)
let make_binding name env = (print_endline ("making binding for " ^ name.name);
  match env with
  | Global_env(e) -> (Global_env (name::e))
  | Whatever (fr, rest) -> (Whatever (name::fr, rest)))
;;

(* extend_env: environment -> environment *)
let extend_env env = match env with
  | (Global_env e) -> Whatever ([], (Global_env e))
  | (Whatever (fr, e)) -> Whatever ([], (Whatever (fr, e)));;

(* END Environment helper *)
(* type_check: top_level list -> type_environment -> unit *)
let rec type_check tl_list start_env = match tl_list with
  | [] -> ()
  | h :: t -> 
    (match h with
      | Definition (gd) -> type_check t (type_check_glob_def gd start_env)
      | Expression (e) -> begin 
                            print_endline "in type checker";
                            ignore (type_check_expr e start_env);
                            type_check t start_env;
                          end)

and arg_types defi args = match args with
      | [] -> [defi.mtype]
      | h::t -> (h.mtype)::(arg_types defi t)

(* bind_arguments: list def -> type_environment -> type_environment *)
and bind_arguments args env = match args with
  | [] -> env
  | h::t -> bind_arguments t (make_binding h env)
  
(* type_check_global_def: global_def -> type_environment -> type_environment *)
and type_check_glob_def gd env = match gd with
  | Func_Glob_Binding (defi, args, e) ->
      let new_env = bind_arguments args (make_binding {name=defi.name; mtype=(Func_type (arg_types defi args))} env) in
        (ignore (type_check_expr e new_env);
         new_env)
  | Var_Glob_Binding (defi, e) ->
      let new_env = make_binding defi env in
        (ignore (type_check_expr e new_env);
        new_env)
        
(* type_check_local_def: local_def -> type_environment -> myType * err_location *)
and type_check_local_def ld env = match ld with
  | Func_Loc_Binding (defi, args, e1, e2) ->
      (let new_env = bind_arguments args (make_binding {name=defi.name; mtype=(Func_type (arg_types defi args))}
                        (extend_env env)) in
        (ignore (type_check_expr e1 new_env);
        type_check_expr e2 new_env))
  | Var_Loc_Binding (defi, e1, e2) ->
      let new_env = (make_binding defi (extend_env env)) in
        (ignore (type_check_expr e1 new_env);
         type_check_expr e2 new_env)
        
(* type_check_expr: expr -> type_environment -> myType * err_location *)
and type_check_expr e env = match e with
  | (Atomic_expr ae) -> type_check_aexpr ae env
  | (Local_def ld) -> type_check_local_def ld env
  | If (e1, e2, e3) ->
      (let (t1,loc1) = type_check_expr e1 env
       and (t2,loc2) = type_check_expr e2 env
       and (t3,loc3) = type_check_expr e3 env
       in match t1 with 
        | Bool_type -> if (t2 = t3) then (t2, loc2) 
                       else raise (TypeError (t2, t3, loc3))
        | _ as twrong -> raise (TypeError (Bool_type, twrong, loc1)))
  | Logic_expr (le, loc) -> type_check_logic_expr le env loc
  | Application (e, arg_list) ->
      (let te = type_check_expr e env in match te with
        | (Func_type(parameters), loc) ->
          (let rec type_check_args args params = match args, params with
            | [],[ret] -> ret
            | [],[] | (_,[]) | (_,[_]) | ([],_) -> 
              raise (WrongNumberOfArguments (((List.length parameters) - 1),(List.length arg_list), loc))
            | ((ha,la)::ta),(hp::tp) -> if ha = hp then (type_check_args ta tp)
                                   else raise (TypeError (hp, ha, la))
           and eval_args args = match args with
            | [] -> []
            | h::t -> (type_check_expr h env)::(eval_args t)
           in ((type_check_args (eval_args arg_list) parameters), loc))
        | (t, loc) -> raise (TypeError (Func_type([]), t, loc)))
      
(* type_check_aexpr: aexpr -> type_environment -> myType * err_location *)
and type_check_aexpr ae env = match ae with
  | Expr(e) -> type_check_expr e env
  | Var(v, loc) -> ((lookup v env loc),loc)
  | Set(s, loc) -> (Set_type,loc)
  | Int(i, loc) -> (Int_type,loc)
  | Bool(b, loc) -> (Bool_type,loc)
  | Word(w,loc) -> (String_type,loc)
  | Built_In(bi, loc) -> ((type_check_built_in bi ),loc)
  
(* type_check_logic_expr: logic_expr -> type_environment -> myType * err_location *)
and type_check_logic_expr le env loc = match le with
  | And_expr (e1, e2) -> 
    (match (type_check_expr e1 env), (type_check_expr e2 env) with
      | (Bool_type, l1), (Bool_type, l2) -> (Bool_type, loc)
      | (Bool_type, l1), ((_ as twrong), l2)  -> raise (TypeError (Bool_type, twrong, loc))
      | ((_ as twrong),l1), (Bool_type, l2)  -> raise (TypeError (Bool_type, twrong, loc))
      | ((_ as twrong),l1), _          -> raise (TypeError (Bool_type, twrong, loc)))
  | Or_expr (e1, e2) -> 
    (match (type_check_expr e1 env), (type_check_expr e2 env) with
      | (Bool_type, l1), (Bool_type, l2) -> (Bool_type, loc)
      | (Bool_type, l1), ((_ as twrong), l2) -> raise (TypeError (Bool_type, twrong, loc))
      | ((_ as twrong),l1), (Bool_type, l2)  -> raise (TypeError (Bool_type, twrong, loc))
      | ((_ as twrong),l1), _       -> raise (TypeError (Bool_type, twrong, loc)))
  | Not_expr (e) -> 
    (match (type_check_expr e env) with
      | (Bool_type, l1)         -> (Bool_type, loc)
      | (_ as twrong, l1)       -> raise (TypeError (Bool_type, twrong, loc)))

(* type_check_built_in: built_in -> myType *)
and type_check_built_in bi = match bi with
  | Cons -> Func_type [String_type; Set_type; Set_type]
  | Head -> Func_type [Set_type; String_type]
  | Tail -> Func_type [Set_type; Set_type]
  | Inteq -> Func_type [Int_type; Int_type; Bool_type]
  | Wordeq -> Func_type [String_type; String_type; Bool_type]
  | Seteq -> Func_type [Set_type; Set_type; Bool_type]
  | Plus -> Func_type [Int_type; Int_type; Int_type]
  | Minus -> Func_type [Int_type; Int_type; Int_type]
  | Mult -> Func_type [Int_type; Int_type; Int_type]
  | Division -> Func_type [Int_type; Int_type; Int_type]
  | Strcomp -> Func_type [String_type; String_type; Bool_type]
  | Strapp -> Func_type [String_type; String_type; String_type]
  | Sort -> Func_type [Set_type; Set_type]
  | Uniq -> Func_type [Set_type; Set_type]



  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  