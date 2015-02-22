open Ast

(* TODO: parametrize these exceptions *)
exception Unbound
exception HeadOfEmptySet
exception TailOfEmptySet
exception NotApplicable
exception WrongNumberOfArguments

(* SECTION Environment helpers *)

type environment =
 | Global_env of frame
 | Whatever of frame * environment

type frame =
 | Bindings of list binding
 
(* lookup: string -> environment -> aexpr; throws Unbound *)
let rec lookup name env =
 let rec lookup_frame name fr =
 	match fr with 
 	 | [] -> raise Unbound
 	 | h::t -> (match h.name_type with
 	 			| Binding(n, t) -> if n = name 
 	 							   then h.value 
 	 							   else lookup_frame t)
 in match env with
 	 | Global_env(f) -> lookup_frame name f
 	 | Whatever(f,e) -> try lookup_frame name f 
 						with Unbound -> lookup name e
;;

(* make_binding: def -> aexpr -> environment -> environment *)
let make_binding name value env =
  let fr = (fst env) in
    let nBind = {name, value} in
      (Bindings(nBind::fr), (snd env))    (* cons the new binding to the beginning of the frame *)
;;

(* extend_env: environment -> environment *)
let extend_env env = (Bindings([]), env);;

(* END Environment helper *)

(* SECTION Built in functions *)

(* myCons: String_type -> Set_type -> Set_type *)
(* myCons: string -> list word -> list word *)
let myCons str aSet =
  let str_to_word str = if str = ":" then Empty_Word else Non_Empty_Word(str)
  in (str_to_word str)::aSet
;;

(* myHead: Set_type -> Word_type *)
(* myHead: list word -> word *)
let myHead aSet = match aSet with
  | [] -> raise HeadOfEmptySet
  | h::t -> h
;;

let myTail aSet = match aSet with
  | [] -> raise TailOfEmptySet
  | h::t -> t
;;

(* myEq: Int_type -> Int_type -> Bool_type *)
(* myEq: int -> int -> myBool *)
let myEq i1 i2 = if i1 = i2 then T else F;;

let myPlus i1 i2 = Int(i1+i2);;

let myMinus i1 i2 = Int(i1-i2);;

(* TODO: define other builtin functions. Especially their types *)

(* END Built in functions *)

(* SECTION Interpreter *)

let rec interpret prog = match prog with
	| Program (tl_list) -> interpret_tl_list tl_list Global_env([])
;;

(* interpret_tl_list: list top_level -> env -> () *)
let rec interpret_tl_list tl_list env = 
  match tl_list with
   | [] -> ()
   | h::t -> 
    (match h with
     | Definition (d) -> interpret_tl_list t (interpret_global_def d env)
     | Expression (e) -> print interpret_expr e env; (* TODO: define function print to print results (print: aexpr -> unit) *)
                         interpret_tl_list t env
    )
;;
		
(* interpret_global_def: global_def -> environment -> environment *)
let rec interpret_global_def gd env = match gd with
	| Func_Glob_Binding (def,args,e) -> make_binding def Closure({ args; env; e; }) env
	| Var_Glob_Binding (def,e)       -> make_binding def (interpret_expr e env) env
;;

(* interpret_local_def: local_def -> environment -> aexpr *)
let rec interpret_local_def ld env = match ld with
	| Func_Local_Binding (def, args, e1, e2) -> interpret_expr e2 (make_binding def 
                                                                              Closure({ args; env; e1; })
                                                                              (extend_env env))
	| Var_Local_Binding (def, e1, e2)        -> interpret_expr e2 (make_binding def 
                                                                              (interpret_expr e env)
                                                                              (extend_env env))
;;

(* interpret_expr: expr -> environment -> aexpr *)
let rec interpret_expr e env = match e with
	| Atomic_expr(ae) -> interpret_aexpr ae
	| Local_def (ld) -> interpret_local_def ld
	| If(guard, consequent, alternate) -> if interpret_aexpr guard then interpret_aexpr consequent
                                                                 else interpret_aexpr alternate
	| Application(e, elist) -> let func = (interpret_expr e) in
                               let rec args elist = match elist with
                                | [] -> []
                                | h::t -> (interpret_aexpr h)::(args t)
                               in match func with
                                | Closure(c)  ->
                                | Built_In(bi) ->
                                | _ -> raise NotApplicable
;;

(* interpret_aexpr: aexpr -> environment -> aexpr *)
let rec interpret_aexpr ae env = match ae with
	| Expr(e)       -> interpret_expr e
	| Var(var_name) -> lookup var_name env
  | _             -> _ (* self evaluating - sets, strings, ints *)
;;
(* apply_closure: closure -> list aexpr -> aexpr *)
let apply_closure c args =
  let rec args_bindings env params args = match params, args with
    | [],[] -> env
    | [],lst
    | lst,[] -> raise WrongNumberOfArguments
    | (ph::pt),(ah::at) -> args_bindings
                            (make_binding (match ph with Binding(name, typ) -> name) ah env)
                            pt at
  in interpret_aexpr (c.lambda).value (args_bindings (extend_env c.env) c.arguments args)
;;

let apply_built_in bi args = match bi with
  | Cons -> myCons args (* TODO: find a way of destructuring the args so we can pass them *)
	| Head -> (myHead)...
	| Tail -> (myTail)
	| Eq ->   (myEq)
	| Plus -> (myPlus)
	| Minus -> (myMinus)
	| Strcomp -> (myStrcomp)
	| Stradd ->  (myStrapp)

(* END Interpreter *)




let rec parse lexbuf = 
	let token = main lexbuf in
	parse lexbuf

let main () =
	let cin =
		if Array.length Sys.argv > 1
		then open_in Sys.argv.(1)
		else stdin
	in
	let lexbuf = Lexing.from_channel cin in
		let result = Scamlparser.main Scamllexer.main lexbuf
		in

	with Eof -> ()

let _ = Printexc.print main ()