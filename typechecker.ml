open Ast

exception TypeError of myType * myType

(* SECTION Environment helpers *)

type myType =
	| Int_type
	| String_type
	| Set_type
	| Bool_type
  | Func_type of myType list
  
type def = 
	| Binding of string * myType

type type_environment =
 | Global_env of def list
 | Whatever of (def list) * type_environment
 
 
(* lookup: string -> environment -> myType; throws Unbound *)
let rec lookup name env =
 let rec lookup_frame name fr =
 	match fr with
 	 | [] -> raise (Unbound name)
 	 | h::tail -> (match h with
                  | Binding(n, t) -> if n = name 
                                   then t
                                   else lookup_frame name tail)
 in (match env with
     | Global_env(f) -> lookup_frame name f
     | Whatever(f,e) -> try lookup_frame name f
                        with Unbound(x) -> lookup name e)
;;

(* make_binding: def -> environment -> environment *)
let make_binding name env = match env with
  | Global_env(e) -> (Global_env (name::e)
  | Whatever (fr, rest) -> (Whatever (name::fr, rest))
;;

(* extend_env: environment -> environment *)
let extend_env env = match env with
  | (Global_env e) -> Whatever ([], (Global_env e))
  | (Whatever (fr, e)) -> Whatever ([], (Whatever (fr, e)));;

(* END Environment helper *)

let rec type_check tl_list start_env

let rec arg_types args = match args with
      | [] -> []
      | h::t -> (h._type)::(arg_types t)


let rec type_check_glob_def gd env = match gd with
  | Func_Glob_Binding (def, args, e) ->
      make_binding {name=def.name; _type=(Func_type (arg_types args))} env
  | Var_Glob_Binding (def, e) ->
      make_binding def env
      
let rec type_check_local_def ld env = match ld with
  | Func_Glob_Binding (def, args, e1, e2) ->
      type_check_expr e2 (make_binding 
        {name=def.name; _type=(Func_type (arg_types args))}
        (extend_env env))
  | Var_Loc_Binding (def, e1, e2) ->
      type_check_expr e2 (make_binding def (extend_env env))
        
  
let rec type_check_expr e env = match e with
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
      (let te = type_check_expr e in match te with
        | Func_type(parameters) ->
          (let rec type_check_args args params = match args, params with
            | [],[ret] -> ret
            | (ha::ta),(hp::tp) -> if ha = hp then (type_check_args ta tp)
                                   else raise (TypeError (hp, ha))
            | _ -> failwith "There was an error in the type checker"
           and eval_args args = match args with
            | [] -> []
            | h::t -> (type_check_expr h)::(eval_args t)
           in type_check_args (eval_args arg_list) parameters)
        | _ as wrongt -> raise (TypeError (Func_type, wrongt)))
        
      
let rec type_check_aexpr ae env = match ae with
  | Expr(e) -> type_check_expr e env
  | Var(v) -> lookup v env
  | Set(s) -> Set_type
  | Int(i) -> Int_type
  | Bool(b) -> Bool_type
  | Word(w) -> Word_type
  | Built_In(bi) -> type_check_built_in
  
let type_check_built_in bi = match bi with
  | Cons -> Func_type [String_type; Set_type; Set_type]
  | Head -> Func_type [Set_type; String_type]
  | Tail -> Func_type [Set_type; Set_type]
  | Eq -> 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  