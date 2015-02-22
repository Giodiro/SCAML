open Ast

type environment =
 | Global_env of frame
 | Whatever of frame * environment

type frame =
 | Bindings of list binding

 type closure = {
 	arguments	:	list def ;
 	env 		:	environment;
 	lambda		:	binding;
 }

exception Unbound

let rec lookup name env =
 let rec lookup_frame name fr =
 	match fr with 
 	 | [] -> throw Unbound
 	 | h::t -> (match h.name_type with
 	 			| Binding(n, t) -> if n = name 
 	 							   then h.value 
 	 							   else lookup_frame t)
 in match env with
 	 | Global_env(f) -> lookup_frame name f
 	 | Whatever(f,e) -> try lookup_frame name f 
 						with Unbound -> lookup name e
;;

let make_binding name value env =
	

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

let myCons a b =


let init_env () =


let rec interpret prog = match prog with
	| Program (tl_list) -> (

		interpret_tl_list tl_list
	)
;;

let rec interpret_tl_list tl_list = match tl_list with
 | [] -> 
 | h::t -> 
	(match h with
 	 | Definition (d) -> interpret_global_def d
 	 | Expression (e) -> interpret_expr e);
	interpret_tl_list t;
;;
		

let rec interpret_global_def gd env = match gd with
	| Func_Glob_Binding (def,args,e) -> (
		)
	| Var_Glob_Binding (def,e) ->
;;

let rec interpret_local_def ld = match ld with
	| Func_Local_Binding (def, args, e1, e2) ->
	| Var_Local_Binding (def, e1, e2) ->
;;

let rec interpret_expr e = match e with
	| Atomic_expr(ae) ->
	| Local_def (ld) -> interpret_local_def ld
	| If(guard, consequent, alternate) ->
	| Application(e, elist) ->
;;

let rec interpret_aexpr ae = match ae with
	| Expr(e) -> interpret_expr e
	| Var(var_name) ->
	| Set(w_list) ->
	| Int(i) ->
	| String(s) ->
	| Built_in(bi) ->
;;

let rec interpret_built_in bi = match bi with
	| Cons ->
	| Head ->
	| Tail ->
	| Eq ->
	| Plus ->
	| Minus ->
	| Strcomp ->
	| Stradd ->
;;