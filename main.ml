open Ast
open String

(* TODO: parametrize these exceptions *)
(* exception Unbound of string*)
(* exception HeadOfEmptySet of string*)
(* exception TailOfEmptySet of string*)
(* exception NotApplicable of string*)
(* exception WrongNumberOfArguments of string*)
exception Unbound
exception HeadOfEmptySet
exception TailOfEmptySet
exception NotApplicable
exception WrongNumberOfArguments
exception WrongType

(* SECTION Environment helpers *)
 
(* lookup: string -> environment -> aexpr; throws Unbound *)
let rec lookup name env =
 let rec lookup_frame name fr =
 	match fr with
 	 | [] -> raise Unbound
 	 | h::tail -> (match h.name_type with
                  | Binding(n, t) -> if n = name 
                                   then h.value 
                                   else lookup_frame name tail)
 in match env with
 	 | Global_env(f) -> lookup_frame name f
 	 | Whatever(f,e) -> try lookup_frame name f
                      with Unbound -> lookup name e
;;

(* make_binding: def -> aexpr -> environment -> environment *)
let make_binding name valu env = match env with
  | Global_env(e) -> let nBind = {name_type = name; value = valu} in
                       (Global_env (nBind::e))
  | Whatever (fr, rest) -> let nBind = {name_type = name; value = valu} in
                       (Whatever (nBind::fr, rest))    (* cons the new binding to the beginning of the frame *)
;;

(* extend_env: environment -> environment *)
let extend_env env = match env with
  | (Global_env e) -> Whatever ([], (Global_env e))
  | (Whatever (fr, e)) -> Whatever ([], (Whatever (fr, e)));;

(* END Environment helper *)

(* SECTION Built in functions *)

(* myCons: String_type -> Set_type -> Set_type *)
(* myCons: string -> list word -> list word *)
let myCons str aSet =
  let str_to_word str = if str = ":" then Empty_Word else Non_Empty_Word(str)
  in Set((str_to_word str)::aSet)
;;

(* myHead: Set_type -> Word_type *)
(* myHead: list word -> word *)
let myHead aSet = match aSet with
  | [] -> raise HeadOfEmptySet
  | h::t -> Word(h)
;;

(* myTail: Set_type -> Set_type *)
(* myTail: list word -> list word *)
let myTail aSet = match aSet with
  | [] -> raise TailOfEmptySet
  | h::t -> Set(t)
;;

(* myEq: Int_type -> Int_type -> Bool_type *)
(* myEq: int -> int -> myBool *)
let myEq i1 i2 = if i1 = i2 then T else F;;

(* myPlus: Int_type -> Int_type -> Int_type *)
(* myPlus: int -> int -> int *)
let myPlus i1 i2 = Int(i1+i2);;

let myMinus i1 i2 = Int(i1-i2);;

(* myStrapp: String_type -> Word_type -> Word_type *)
(* myStrapp: string -> word -> word *)
let myStrapp w str = match w with
  | Empty_Word -> Non_Empty_Word str
  | Non_Empty_Word w -> Non_Empty_Word (w ^ str)
;;
(* 
  see http://caml.inria.fr/pub/docs/manual-caml-light/node14.17.html for compare_strings.
  Returns 0 if s1 and s2 are equal (or one is prefix of the other),
  -1 if str1 is lexicographically before str2,
  1 if str2 is lexicographically before str1
  myStrcomp: string -> string -> Int
*)
let myStrcomp str1 str2 =
  match compare str1 str2 with
   | 0 | 2 | -2 -> Int(0)
   | _   as x   -> Int(x)
;;

(* END Built in functions *)

(* SECTION Helper functions *)

let print_aexpr ae = match ae with
  | Set(wl) -> (
    let rec print_set s = match s with
      | [] -> print_string "}"
      | h::t -> (match h with
                | Non_Empty_Word(w) -> print_string w; print_string ", "
                | Empty_Word        -> print_string ":"; print_string ", ")
    in (print_string "{ "; print_set wl))
  | Int(i) -> print_int i
  | (Word w) -> (match w with
                | Non_Empty_Word(wo) -> print_string wo; print_string ", "
                | Empty_Word        -> print_string ":"; print_string ", ")
  | (Bool b) -> (match b with
                | T -> print_string "True "
                | F -> print_string "False ")
  | String (s) -> print_string s
  | _ -> raise NotApplicable
;;

let myBool_to_bool mBool = match mBool with
  | T -> true
  | F -> false
;;

let apply_2 func args =
  match args with
    [a1; a2] -> func a1 a2
   | _  	   -> raise WrongNumberOfArguments
;;

let apply_1 func args = 
  match args with
   | [a1] -> func a1
   | _    -> raise WrongNumberOfArguments
;;

(* END Helper functions *)

(* SECTION Interpreter *)

let rec interpret prog = match prog with
	| Program (tl_list) -> interpret_tl_list tl_list (Global_env [])
  
(* interpret_tl_list: list top_level -> environment -> () *)
and interpret_tl_list tl_list env = 
  match tl_list with
   | [] -> ()
   | h::t -> 
    (match h with
     | Definition (d) -> interpret_tl_list t (interpret_global_def d env)
     | Expression (e) -> print_aexpr (interpret_expr e env);
                         interpret_tl_list t env
    )		
(* interpret_global_def: global_def -> environment -> environment *)
and interpret_global_def gd envi = match gd with
	| Func_Glob_Binding (def,args,e) -> make_binding def (Closure { parameters = args; env = envi; lambda = e; }) envi
	| Var_Glob_Binding (def,e)       -> make_binding def (interpret_expr e envi) envi

(* interpret_local_def: local_def -> environment -> aexpr *)
and interpret_local_def ld envi = match ld with
	| Func_Loc_Binding (def, args, e1, e2) -> interpret_expr e2 (make_binding def 
                                                                              (Closure { parameters = args; env = envi; lambda = e1; })
                                                                              (extend_env envi))
	| Var_Loc_Binding (def, e1, e2)        -> interpret_expr e2 (make_binding def 
                                                                              (interpret_expr e1 envi)
                                                                              (extend_env envi))

(* interpret_expr: expr -> environment -> aexpr *)
and interpret_expr e env = match e with
	| Atomic_expr(ae) -> interpret_aexpr ae env
	| Local_def (ld) -> interpret_local_def ld env
	| If(guard, consequent, alternate) -> 
      (let guard' = interpret_aexpr guard env in
        match guard' with
         | Bool(b) -> if myBool_to_bool b then interpret_aexpr consequent env
                                          else interpret_aexpr alternate env
         | _       -> raise WrongType)
	| Application(e, exprList) -> let func = (interpret_expr e env) in
                                 let rec args elist = match elist with (* Evaluates all arguments *)
                                  | [] -> []
                                  | h::t -> (interpret_aexpr h)::(args t)
                                 in match func with
                                  | Closure(c)   -> apply_closure c (args exprList)
                                  | Built_In(bi) -> apply_built_in bi (args exprList)
                                  | _ -> raise NotApplicable

(* interpret_aexpr: aexpr -> environment -> aexpr *)
and interpret_aexpr ae env = match ae with
	| Expr(e)       -> interpret_expr e env
	| Var(var_name) -> lookup var_name env
  | _  as x       -> x (* self evaluating - sets, strings, ints *)

and args_bindings params args env = match params, args with
  | [],[] -> env
  | [],lst
  | lst,[] -> raise WrongNumberOfArguments
  | (ph::pt),(ah::at) -> args_bindings pt at (make_binding ph ah env)
(* apply_closure: closure -> list aexpr -> aexpr *)
and apply_closure (c:closure) (args:aexpr list) =
  interpret_aexpr (c.lambda).value (args_bindings c.arguments args (extend_env c.env))

(*apply_built_in: Built_In -> list aexpr -> aexpr *)
and apply_built_in bi args = match bi with
  | Cons -> apply_2 myCons args
	| Head -> apply_1 myHead args
	| Tail -> apply_1 myTail args
	| Eq ->   appply_2 myEq args
	| Plus -> apply_2 myPlus args
	| Minus -> apply_2 myMinus args
	| Strcomp -> apply_2 myStrcomp args
	| Strapp ->  apply_2 myStrapp args
;;
(* END Interpreter *)

let main () =
	let cin =
		if Array.length Sys.argv > 1
		then open_in Sys.argv.(1)
		else stdin
	in
	let lexbuf = Lexing.from_channel cin in
		let result = Scamlparser.main Scamllexer.main lexbuf
		in interpret result
;;

let _ = Printexc.print main ()