open Ast

exception TypeError of myType * myType

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
let rec lookup name env =
 let rec lookup_frame name fr =
 	match fr with
 	 | [] -> raise (Unbound name)
 	 | h::tail -> (if h.name = name then h.mtype else lookup_frame name tail)
 in (match env with
     | Global_env(f) -> lookup_frame name f
     | Whatever(f,e) -> try lookup_frame name f
                        with Unbound(x) -> lookup name e)
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

let rec type_check tl_list start_env = match tl_list with
  | [] -> ()
  | h :: t -> 
    (match h with
      | Definition (gd) -> type_check t (type_check_glob_def gd start_env)
      | Expression (e) -> begin 
                            print_endline "in type checker";
                            type_check_expr e start_env;
                            type_check t start_env;
                          end)

and arg_types defi args = match args with
      | [] -> [defi.mtype]
      | h::t -> (h.mtype)::(arg_types defi t)

(* bind_arguments: list def -> type_environment -> type_environment*)
and bind_arguments args env = match args with
  | [] -> env
  | h::t -> bind_arguments t (make_binding h env)

and type_check_glob_def gd env = match gd with
  | Func_Glob_Binding (defi, args, e) ->
      let new_env = bind_arguments args (make_binding {name=defi.name; mtype=(Func_type (arg_types defi args))} env) in
        (type_check_expr e new_env;
        new_env)
  | Var_Glob_Binding (defi, e) ->
      let new_env = make_binding defi env in
        (type_check_expr e new_env;
        new_env)
      
and type_check_local_def ld env = match ld with
  | Func_Loc_Binding (defi, args, e1, e2) ->
      (let new_env = bind_arguments args (make_binding {name=defi.name; mtype=(Func_type (arg_types defi args))}
                        (extend_env env)) in
        (type_check_expr e1 new_env;
         type_check_expr e2 new_env))
  | Var_Loc_Binding (defi, e1, e2) ->
      let new_env = (make_binding defi (extend_env env)) in
        (type_check_expr e1 new_env;
         type_check_expr e2 new_env)
        
(* type_check_expr: expr -> enironment -> type *)
and type_check_expr e env = match e with
  | (Atomic_expr ae) -> type_check_aexpr ae env
  | (Local_def ld) -> type_check_local_def ld env
  | If (e1, e2, e3) ->
      (let t1 = type_check_expr e1 env
       and t2 = type_check_expr e2 env
       and t3 = type_check_expr e3 env
       in match t1 with 
        | Bool_type -> if (t2 = t3) then t2 
                       else raise (TypeError (t2, t3))
        | _ as twrong -> raise (TypeError (Bool_type, twrong)))
  | Application (e, arg_list) ->
      (let te = type_check_expr e env in match te with
        | Func_type(parameters) ->
          (let rec type_check_args args params = match args, params with
            | [],[ret] -> ret
            | (ha::ta),(hp::tp) -> if ha = hp then (type_check_args ta tp)
                                   else raise (TypeError (hp, ha))
            | _ -> failwith "There was an error in the type checker"
           and eval_args args = match args with
            | [] -> []
            | h::t -> (type_check_expr h env)::(eval_args t)
           in type_check_args (eval_args arg_list) parameters)
        | _ as wrongt -> raise (TypeError (Func_type([Int_type;Int_type]), wrongt)))
        
      
and type_check_aexpr ae env = match ae with
  | Expr(e) -> type_check_expr e env
  | Var(v) -> lookup v env
  | Set(s) -> Set_type
  | Int(i) -> Int_type
  | Bool(b) -> Bool_type
  | Word(w) -> String_type
  | Built_In(bi) -> type_check_built_in bi 
  
and type_check_built_in bi = match bi with
  | Cons -> Func_type [String_type; Set_type; Set_type]
  | Head -> Func_type [Set_type; String_type]
  | Tail -> Func_type [Set_type; Set_type]
  | Inteq -> Func_type [Int_type; Int_type; Bool_type]
  | Wordeq -> Func_type [String_type; String_type; Bool_type]
  | Seteq -> Func_type [Set_type; Set_type; Bool_type]
  | Plus -> Func_type [Int_type; Int_type; Int_type]
  | Minus -> Func_type [Int_type; Int_type; Int_type]
  | Strcomp -> Func_type [String_type; String_type; Bool_type]
  | Strapp -> Func_type [String_type; String_type; String_type]
  | Sort -> Func_type [Set_type; Set_type]
  | Uniq -> Func_type [Set_type; Set_type]



  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  