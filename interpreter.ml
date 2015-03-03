open Ast
open Library
open Printf

(* SECTION Environment helpers *)
 
(* lookup: string -> environment -> aexpr; throws Unbound *)
let rec lookup name env loc =
 let rec lookup_frame name fr =
   match fr with
    | [] -> raise (Unbound (name, loc))
    | h::tail -> if (h.name_type.name = name) then h.value
                else lookup_frame name tail
 in (match env with
     | Global_env(f) -> lookup_frame name f
     | Whatever(f,e) -> try lookup_frame name f
                        with Unbound(_) -> lookup name e loc)
;;

(* make_binding: def -> aexpr -> environment -> environment *)
let make_binding name valu env = match env with
  | Global_env(e) -> let nBind = {name_type = name; value = valu} in
                       (printf "extending global environment with %s\n" name.name;
                       (Global_env (nBind::e)))
  | Whatever (fr, rest) -> let nBind = {name_type = name; value = valu} in
                       (Whatever (nBind::fr, rest))    (* cons the new binding to the beginning of the frame *)
;;

(* extend_env: environment -> environment *)
let extend_env env = match env with
  | (Global_env e) -> Whatever ([], (Global_env e))
  | (Whatever (fr, e)) -> Whatever ([], (Whatever (fr, e)));;

(* END Environment helper *)

(* SECTION Helper functions *)

let rec string_of_type t = match t with
  | Int_type -> "int"
  | String_type -> "string"
  | Set_type -> "set"
  | Bool_type -> "bool"
  | Func_type (tl) -> 
      (let rec params_to_string params = match params with
        | []    -> ""
        | [ret] -> string_of_type ret
        | h::t  -> (string_of_type h) ^ " -> " ^ (params_to_string t)
      in (params_to_string tl) ^ " = <fun>")
                    

(* myBool_to_bool: myBool -> bool *)
let myBool_to_bool mBool = match mBool with
  | T -> true
  | F -> false
;;

(* myBool_to_bool: bool -> myBool *)
let bool_to_myBool mBool = match mBool with
  | true -> T
  | false -> F
;;

let rec func_type_of_gd args defi = match args with
      | [] -> [defi.mtype]
      | h::t -> (h.mtype)::(func_type_of_gd t defi)

(* END Helper functions *)

(* SECTION Interpreter *)

let rec interpret tl_list start_env = interpret_tl_list tl_list start_env
  
(* interpret_tl_list: list top_level -> environment -> () *)
and interpret_tl_list tl_list env = 
  match tl_list with
   | [] -> ()
   | h::t -> 
    (match h with
     | Definition (d) -> print_endline "Detected def";
                         interpret_tl_list t (interpret_global_def d env)
     | Expression (e) -> print_endline "Detected expr";
                         print_aexpr (interpret_expr e env);
                         interpret_tl_list t env)

(* interpret_global_def: global_def -> environment -> environment *)
and interpret_global_def gd envi = match gd with
  | Func_Glob_Binding (defi,args,e) -> 
      let newClosure = { parameters = args; env = envi; lambda = e; } in
      let newEnv = (make_binding 
                      {name=defi.name; mtype=(Func_type (func_type_of_gd args defi))}
                      (Closure newClosure) envi) in 
        (newClosure.env <- newEnv; newEnv)
  | Var_Glob_Binding (defi,e) -> 
      make_binding defi (interpret_expr e envi) envi

(* interpret_local_def: local_def -> environment -> expr *)
and interpret_local_def ld envi = match ld with
  | Func_Loc_Binding (defi, args, e1, e2) -> 
      let newClosure = {parameters = args; env = envi; lambda = e1} in
      let extendedEnv = (extend_env envi) in
      let newEnv = (make_binding 
                      {name=defi.name; mtype=(Func_type (func_type_of_gd args defi))}
                      (Closure newClosure) extendedEnv) in
        (newClosure.env <- newEnv; interpret_expr e2 newEnv)
  | Var_Loc_Binding (defi, e1, e2) ->
      interpret_expr e2 (make_binding defi (interpret_expr e1 envi) (extend_env envi))

(* interpret_expr: expr -> environment -> aexpr *)
and interpret_expr e env = match e with
  | Atomic_expr(ae) -> interpret_aexpr ae env
  | Local_def (ld) -> interpret_local_def ld env
  | If(guard, consequent, alternate) -> 
      (let guard' = interpret_expr guard env in
        match guard' with
         | Bool(b, _) -> if myBool_to_bool b then interpret_expr consequent env
                                          else interpret_expr alternate env
         | _       -> raise (WrongType Bool_type))
  | Logic_expr (le, loc) -> interpret_logic_expr le env
  | Application(e, arguments) -> let func = (interpret_expr e env) in
                                 let rec eval_args elist = match elist with (* Evaluates all arguments *)
                                  | [] -> []
                                  | h::t -> (interpret_expr h env)::(eval_args t)
                                 in match func with
                                  | Closure(c)   -> apply_closure c (eval_args arguments)
                                  | Built_In(bi, _) -> apply_built_in bi (eval_args arguments)
                                  | _ -> raise (WrongType (Func_type []))

(* interpret_aexpr: aexpr -> environment -> aexpr *)
and interpret_aexpr ae env = match ae with
  | Expr(e)         -> interpret_expr e env
  | Var(var_name, loc) -> lookup var_name env loc
  | _ as x -> x

and interpret_logic_expr le env = match le with 
  | And_expr (e1, e2) -> 
    (match (interpret_expr e1 env), (interpret_expr e2 env) with
      | Bool(b1, l1), Bool(b2, l2) -> 
          Bool ((bool_to_myBool (myBool_to_bool b1 && myBool_to_bool b2)), l1)
      | _, _  -> raise (WrongType Bool_type))
  | Or_expr (e1, e2) -> 
    (match (interpret_expr e1 env), (interpret_expr e2 env) with
      | Bool(b1, l1), Bool(b2, l2) -> Bool ((bool_to_myBool (myBool_to_bool b1 || myBool_to_bool b2)), l1)
      | _, _               -> raise (WrongType Bool_type))
  | Not_expr (e) -> 
    (match (interpret_expr e env) with
      | Bool(b, l) -> Bool ((bool_to_myBool (not (myBool_to_bool b))), l)
      | _       -> raise (WrongType Bool_type))

and args_bindings params args env = match params, args with
  | [],[] -> env
  | (ph::pt),(ah::at) -> args_bindings pt at (make_binding ph ah env)
  
(* apply_closure: closure -> list aexpr -> aexpr *)
and apply_closure c args =
  interpret_expr (c.lambda) (args_bindings c.parameters args (extend_env c.env))


(*apply_built_in: Built_In -> list aexpr -> aexpr *)
and apply_built_in bi args = match bi with
  | Cons -> (match args with
              | [a1; a2] -> (match a1, a2 with
                              | Word(w, loc1),Set(wl, loc2) -> Set ((myCons w wl),loc1)
                              | _ -> raise (WrongType String_type)))
  | Head -> (match args with
              | [a1] -> (match a1 with
                          | Set(s, loc1) -> Word ((myHead s), loc1)
                          | _ -> raise (WrongType Set_type)))
  | Tail -> (match args with
              | [a1] -> (match a1 with
                          | Set(s, loc1) -> Set ((myTail s), loc1)
                          | _ -> raise (WrongType Set_type)))
  | Inteq -> (match args with
                | [a1; a2] -> (match a1, a2 with
                                | Int(i1, loc1), Int(i2, loc2) -> 
                                  (Bool ((myEq i1 i2), loc1))
                                | _, _        -> raise (WrongType Int_type)))
  | Wordeq -> (match args with
                | [a1; a2] -> (match a1, a2 with
                                | Word(w1, loc1), Word(w2, loc2) -> 
                                  (Bool ((if (myWordcomp w1 w2) = 0 then T else F), loc1))
                                | _, _        -> raise (WrongType String_type)))
  | Seteq -> (match args with
                | [a1; a2] -> (match a1, a2 with
                                | Set(s1, loc1), Set(s2, loc2) -> 
                                  (Bool ((mySetEq s1 s2), loc1))
                                | _, _        -> raise (WrongType Set_type)))
  | Plus -> (match args with
              | [a1; a2] -> (match a1, a2 with
                              | Int(i1, loc1),Int(i2, loc2) -> Int ((i1+i2),loc1)
                              | _ -> raise (WrongType Int_type)))
  | Minus -> (match args with
              | [a1; a2] -> (match a1, a2 with
                              | Int(i1, loc1),Int(i2, loc2) -> Int ((i1-i2),loc1)
                              | _ -> raise (WrongType Int_type)))
  | Mult -> (match args with
              | [a1; a2] -> (match a1, a2 with
                              | Int(i1, loc1),Int(i2, loc2) -> Int ((i1*i2),loc1)
                              | _ -> raise (WrongType Int_type)))
  | Division -> (match args with
              | [a1; a2] -> (match a1, a2 with
                              | Int(i1, loc1),Int(i2, loc2) -> Int ((i1/i2),loc1)
                              | _ -> raise (WrongType Int_type)))
  | Strcomp -> (match args with
              | [a1; a2] -> (match a1, a2 with
                              | Word(w1, loc1),Word(w2, loc2)-> Int ((myWordcomp w1 w2),loc1)
                              | _ -> raise (WrongType String_type)))
  | Strapp ->  (match args with
              | [a1; a2] -> (match a1, a2 with
                              | Word(w1, loc1),Word(w2, loc2) -> (Word ((myStrapp w1 w2),loc1))
                              | _ -> raise (WrongType String_type)))
  | Sort   -> (match args with
              | [a1] -> (match a1 with
                          | Set(s, loc1) -> Set ((mySort s),loc1)
                          | _ -> raise (WrongType Set_type)))
  | Uniq   -> (match args with
              | [a1] -> (match a1 with
                          | Set(s, loc1) -> Set ((myUniq s),loc1)
                          | _ -> raise (WrongType Set_type)))
;;
(* END Interpreter *)