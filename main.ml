open Ast
open String
open Printf

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
 in (printf "looking up %s\n" name;
  (match env with
 	 | Global_env(f) -> lookup_frame name f
 	 | Whatever(f,e) -> try lookup_frame name f
                      with Unbound -> lookup name e))
;;

(* make_binding: def -> aexpr -> environment -> environment *)
let make_binding name valu env = match env with
  | Global_env(e) -> let nBind = {name_type = name; value = valu} in
                       (printf "extending global environment with %s\n" (match name with Binding (n,t) -> n);
                       (Global_env (nBind::e)))
  | Whatever (fr, rest) -> let nBind = {name_type = name; value = valu} in
                       (Whatever (nBind::fr, rest))    (* cons the new binding to the beginning of the frame *)
;;

(* extend_env: environment -> environment *)
let extend_env env = match env with
  | (Global_env e) -> Whatever ([], (Global_env e))
  | (Whatever (fr, e)) -> Whatever ([], (Whatever (fr, e)));;

(* END Environment helper *)

(* SECTION Built in functions *)

(* myCons: word -> list word -> aexpr (Set) *)
let myCons str aSet = Set(str::aSet)

(* myHead: list word -> aexpr (Word) *)
let myHead aSet = match aSet with
  | [] -> raise HeadOfEmptySet
  | h::t -> Word(h)
;;

(* myTail: list word -> aexpr (Set) *)
let myTail aSet = match aSet with
  | [] -> raise TailOfEmptySet
  | h::t -> Set(t)
;;

(* myEq: int -> int -> aexpr (Bool) *)
let myEq i1 i2 = if i1 = i2 then Bool (T) else Bool (F);;

(* myPlus: int -> int -> aexpr (Int) *)
let myPlus i1 i2 = Int(i1+i2);;

(* myMinus: int -> int -> aexpr (Int) *)
let myMinus i1 i2 = Int(i1-i2);;

(* myStrapp: word -> word -> word *)
let myStrapp w1 w2 = match w1,w2 with
  | Empty_Word, Empty_Word -> Empty_Word
  | (Non_Empty_Word x1), Empty_Word -> w1
  | Empty_Word, (Non_Empty_Word x2) -> w2
  | (Non_Empty_Word x1), (Non_Empty_Word x2) -> Non_Empty_Word (x1 ^ x2)
;;

(* 
  see http://caml.inria.fr/pub/docs/manual-caml-light/node14.17.html for compare_strings.
  Returns 0 if s1 and s2 are equal (or one is prefix of the other),
  -1 if str1 is lexicographically before str2,
  1 if str2 is lexicographically before str1
  myStrcomp: string -> string -> int
*)
let myStrcomp str1 str2 =
  match compare str1 str2 with
   | 0 | 2 | -2 -> 0
   | _   as x   -> x
;;

(* myWordcomp: word -> word -> int *)
let myWordcomp w1 w2 = match w1, w2 with
  | Empty_Word, Empty_Word -> 0
  | Empty_Word, _ -> -1
  | _, Empty_Word -> 1
  | (Non_Empty_Word new1), (Non_Empty_Word new2) -> myStrcomp new1 new2 
;;

(* mySetEq: word list -> word list -> myBool *)
let mySetEq s1 s2 = 
  let rec mySetEqHelper s1 s2 = match s1, s2 with
    | [], [] -> T 
    | [], _ -> F
    | _, [] -> F
    | (h1::t1), (h2::t2) -> if (myWordcomp h1 h2) = 0  
                            then mySetEqHelper t1 t2
                            else F 
  in mySetEqHelper (List.sort myWordcomp s1)
                   (List.sort myWordcomp s2)
;;

(* END Built in functions *)

(* SECTION Helper functions *)

(* print_aexpr: aexpr -> unit *)
let print_aexpr ae = match ae with
  | (Set wl) -> (
    let rec print_set s = match s with
      | [] -> print_string "}"
      | h::t -> ((match h with
                | Non_Empty_Word(w) -> print_string w; print_string ", "
                | Empty_Word        -> print_string ":"; print_string ", ");
                print_set t)
    in (print_string "{ "; print_set wl; print_string "\n"; flush_all ()))
  | (Int i) -> print_endline (string_of_int i)
  | (Word w) -> ((match w with
                | Non_Empty_Word(wo) -> print_string wo; print_string ", "
                | Empty_Word        -> print_string ":"; print_string ", ");
                flush_all ())
  | (Bool b) -> (match b with
                | T -> print_endline "True "
                | F -> print_endline "False ")
  (*| (String s) -> print_endline s*)
  | _ -> raise NotApplicable
;;

(* myBool_to_bool: myBool -> bool *)
let myBool_to_bool mBool = match mBool with
  | T -> true
  | F -> false
;;

(* END Helper functions *)

(* SECTION Interpreter *)

let rec interpret tl_list = interpret_tl_list tl_list (Global_env [])
  
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
	| Func_Glob_Binding (def,args,e) -> let newClosure = { parameters = args; env = envi; lambda = e; } in
                                        let newEnv = (make_binding def (Closure newClosure) envi) in 
                                          (newClosure.env <- newEnv; newEnv)
	| Var_Glob_Binding (def,e)       -> make_binding def (interpret_expr e envi) envi

(* interpret_local_def: local_def -> environment -> aexpr *)
and interpret_local_def ld envi = match ld with
	| Func_Loc_Binding (def, args, e1, e2) -> let newClosure = {parameters = args; env = envi; lambda = e1} in
                                              let extendedEnv = (extend_env envi) in
                                                let newEnv = (make_binding def (Closure newClosure) extendedEnv) in
                                                  (newClosure.env <- newEnv; interpret_expr e2 newEnv)
	| Var_Loc_Binding (def, e1, e2)        -> interpret_expr e2 (make_binding def 
                                                                              (interpret_expr e1 envi)
                                                                              (extend_env envi))

(* interpret_expr: expr -> environment -> aexpr *)
and interpret_expr e env = match e with
	| Atomic_expr(ae) -> interpret_aexpr ae env
	| Local_def (ld) -> interpret_local_def ld env
	| If(guard, consequent, alternate) -> 
      (let guard' = interpret_expr guard env in
        match guard' with
         | Bool(b) -> if myBool_to_bool b then interpret_expr consequent env
                                          else interpret_expr alternate env
         | _       -> raise WrongType)
	| Application(e, exprList) -> let func = (interpret_expr e env) in
                                 let rec eval_args elist = match elist with (* Evaluates all arguments *)
                                  | [] -> []
                                  | h::t -> (interpret_expr h env)::(eval_args t)
                                 in match func with
                                  | Closure(c)   -> apply_closure c (eval_args exprList)
                                  | Built_In(bi) -> apply_built_in bi (eval_args exprList)
                                  | _ -> raise NotApplicable

(* interpret_aexpr: aexpr -> environment -> aexpr *)
and interpret_aexpr ae env = match ae with
	| Expr(e)       -> interpret_expr e env
	| Var(var_name) -> lookup var_name env
  | _  as x       -> x (* self evaluating - sets, strings, ints *)

and args_bindings params args env = match params, args with
  | [],[] -> env
  | [],lst -> raise WrongNumberOfArguments
  | lst,[] -> raise WrongNumberOfArguments
  | (ph::pt),(ah::at) -> args_bindings pt at (make_binding ph ah env)
(* apply_closure: closure -> list aexpr -> aexpr *)
and apply_closure c args =
  interpret_expr (c.lambda) (args_bindings c.parameters args (extend_env c.env))


(*apply_built_in: Built_In -> list aexpr -> aexpr *)
and apply_built_in bi args = match bi with
  | Cons -> (match args with
              | [a1; a2] -> (match a1, a2 with
                              | Word(w),Set(wl) -> (print_endline "cons";myCons w wl)
                              | _ -> raise WrongType )
              | _ -> raise WrongNumberOfArguments)
	| Head -> (match args with
              | [a1] -> (match a1 with
                          | Set(s) -> (print_endline "head"; myHead s)
                          | _ -> raise WrongType)
              | _    -> raise WrongNumberOfArguments)
	| Tail -> (match args with
              | [a1] -> (match a1 with
                          | Set(s) -> (print_endline "tail"; myTail s)
                          | _ -> raise WrongType)
              | _    -> raise WrongNumberOfArguments)
	| Eq ->   (match args with
              | [a1; a2] -> (match a1, a2 with
                              | Int(i1),Int(i2) -> (print_endline "eq int"; myEq i1 i2)
                              | Set(s1),Set(s2) -> (print_endline "eq set"; Bool (mySetEq s1 s2))
                              | _ -> (print_endline "eq wrong"; print_aexpr a1; raise WrongType ))
              | _ -> raise WrongNumberOfArguments)
	| Plus -> (match args with
              | [a1; a2] -> (match a1, a2 with
                              | Int(i1),Int(i2) -> (print_endline "plus"; myPlus i1 i2)
                              | _ -> raise WrongType )
              | _ -> raise WrongNumberOfArguments)
	| Minus -> (match args with
              | [a1; a2] -> (match a1, a2 with
                              | Int(i1),Int(i2) -> (print_endline "minus"; myMinus i1 i2);
                              | _ -> raise WrongType )
              | _ -> raise WrongNumberOfArguments)
	(*| Strcomp -> (match args with
              | [a1; a2] -> (match a1, a2 with
                              | String(s1),String(s2) -> Int (myStrcomp s1 s2)
                              | _ -> raise WrongType )
              | _ -> raise WrongNumberOfArguments)*)
	| Strapp ->  (match args with
              | [a1; a2] -> (match a1, a2 with
                              | Word(w1),Word(w2) -> (print_endline "strapp"; Word(myStrapp w1 w2))
                              | _ -> raise WrongType )
              | _ -> raise WrongNumberOfArguments)
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
		in (print_endline "in interpreter";
        interpret result)
;;

let _ = Printexc.print main ()