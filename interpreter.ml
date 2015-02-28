open Ast
open Library
open Printf

(* SECTION Environment helpers *)
 
(* lookup: string -> environment -> aexpr; throws Unbound *)
let rec lookup name env =
 let rec lookup_frame name fr =
 	match fr with
 	 | [] -> raise (Unbound name)
 	 | h::tail -> if (h.name_type.name = name) then h.value
                else lookup_frame name tail
 in (match env with
     | Global_env(f) -> lookup_frame name f
     | Whatever(f,e) -> try lookup_frame name f
                        with Unbound(x) -> lookup name e)
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

let rec arg_types args = match args with
      | [] -> []
      | h::t -> (h._type)::(arg_types t)

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
                         interpret_tl_list t env
    )
(* interpret_global_def: global_def -> environment -> environment *)
and interpret_global_def gd envi = match gd with
	| Func_Glob_Binding (def,args,e) -> 
      let newClosure = { parameters = args; env = envi; lambda = e; } in
      let newEnv = (make_binding 
                      {name=def.name; _type=(Func_type (arg_types args))}
                      (Closure newClosure) envi) in 
        (newClosure.env <- newEnv; newEnv)
	| Var_Glob_Binding (def,e) -> 
      make_binding def (interpret_expr e envi) envi

(* interpret_local_def: local_def -> environment -> expr *)
and interpret_local_def ld envi = match ld with
	| Func_Loc_Binding (def, args, e1, e2) -> 
      let newClosure = {parameters = args; env = envi; lambda = e1} in
      let extendedEnv = (extend_env envi) in
      let newEnv = (make_binding 
                      {name=def.name; _type=(Func_type (arg_types args))}
                      (Closure newClosure) extendedEnv) in
        (newClosure.env <- newEnv; interpret_expr e2 newEnv)
	| Var_Loc_Binding (def, e1, e2) ->
      interpret_expr e2 (make_binding def (interpret_expr e1 envi) (extend_env envi))

(* interpret_expr: expr -> environment -> aexpr *)
and interpret_expr e env = match e with
	| Atomic_expr(ae) -> interpret_aexpr ae env
	| Local_def (ld) -> interpret_local_def ld env
	| If(guard, consequent, alternate) -> 
      (let guard' = interpret_expr guard env in
        match guard' with
         | Bool(b) -> if myBool_to_bool b then interpret_expr consequent env
                                          else interpret_expr alternate env
         | _       -> raise (WrongType Bool_type))
         
	| Application(e, arguments) -> let func = (interpret_expr e env) in
                                 let rec eval_args elist = match elist with (* Evaluates all arguments *)
                                  | [] -> []
                                  | h::t -> (interpret_expr h env)::(eval_args t)
                                 in match func with
                                  | Closure(c)   -> apply_closure c (eval_args arguments)
                                  | Built_In(bi) -> apply_built_in bi (eval_args arguments)
                                  | _ -> raise (WrongType (Func_type []))

(* interpret_aexpr: aexpr -> environment -> aexpr *)
and interpret_aexpr ae env = match ae with
	| Expr(e)         -> interpret_expr e env
	| Var(var_name)   -> lookup var_name env
  | _ as x          -> x

and args_bindings params args env = match params, args with
  | [],[] -> env
  | [],lst -> raise (WrongNumberOfArguments ((List.length params),(List.length args)))
  | lst,[] -> raise (WrongNumberOfArguments ((List.length params),(List.length args)))
  | (ph::pt),(ah::at) -> args_bindings pt at (make_binding ph ah env)
  
(* apply_closure: closure -> list aexpr -> aexpr *)
and apply_closure c args =
  interpret_expr (c.lambda) (args_bindings c.parameters args (extend_env c.env))


(*apply_built_in: Built_In -> list aexpr -> aexpr *)
and apply_built_in bi args = match bi with
  | Cons -> (match args with
              | [a1; a2] -> (match a1, a2 with
                              | Word(w),Set(wl) -> Set (myCons w wl)
                              | _ -> raise (WrongType String_type))
              | _ -> raise (WrongNumberOfArguments (2, (List.length args))))
	| Head -> (match args with
              | [a1] -> (match a1 with
                          | Set(s) -> Word (myHead s)
                          | _ -> raise (WrongType Set_type))
              | _    -> raise (WrongNumberOfArguments (1,(List.length args))))
	| Tail -> (match args with
              | [a1] -> (match a1 with
                          | Set(s) -> Set (myTail s)
                          | _ -> raise (WrongType Set_type))
              | _    -> raise (WrongNumberOfArguments (1,(List.length args))))
	| Eq ->   (match args with
              | [a1; a2] -> (match a1, a2 with
                              | Int(i1),Int(i2) -> (print_endline "eq int"; myEq i1 i2)
                              | Set(s1),Set(s2) -> (print_endline "eq set"; Bool (mySetEq s1 s2))
                              | Word(w1),Word(w2) -> (print_endline "eq string"; Bool (if (myWordcomp w1 w2) = 0 then T else F))
                              | Int(x),_ -> raise (WrongType Int_type)
                              | Set(x),_ -> raise (WrongType Set_type)
                              | Word(x),_ -> raise (WrongType String_type)
                              | _ -> raise (WrongType Int_type)) (*Whatever*)
              | _ -> raise (WrongNumberOfArguments (2,(List.length args))))
	| Plus -> (match args with
              | [a1; a2] -> (match a1, a2 with
                              | Int(i1),Int(i2) -> (print_endline "plus"; myPlus i1 i2)
                              | _ -> raise (WrongType Int_type))
              | _ -> raise (WrongNumberOfArguments (2,(List.length args))))
	| Minus -> (match args with
              | [a1; a2] -> (match a1, a2 with
                              | Int(i1),Int(i2) -> (print_endline "minus"; myMinus i1 i2);
                              | _ -> raise (WrongType Int_type))
              | _ -> raise (WrongNumberOfArguments (2,(List.length args))))
	| Strcomp -> (match args with
              | [a1; a2] -> (match a1, a2 with
                              | Word(w1),Word(w2)-> Int (myWordcomp w1 w2)
                              | _ -> raise (WrongType String_type))
              | _ -> raise (WrongNumberOfArguments (2, (List.length args))))
	| Strapp ->  (match args with
              | [a1; a2] -> (match a1, a2 with
                              | Word(w1),Word(w2) -> (print_endline "strapp"; Word (myStrapp w1 w2))
                              | _ -> raise (WrongType String_type))
              | _ -> raise (WrongNumberOfArguments (2,(List.length args))))
  | Sort   -> (match args with
              | [a1] -> (match a1 with
                          | Set(s) -> mySort s
                          | _ -> raise (WrongType Set_type))
              | _ -> raise (WrongNumberOfArguments (1,(List.length args))))
  | Uniq   -> (match args with
              | [a1] -> (match a1 with
                          | Set(s) -> myUniq s
                          | _ -> raise (WrongType Set_type))
              | _ -> raise (WrongNumberOfArguments (1,(List.length args))))
;;
(* END Interpreter *)