(* File scamllexer.mll *)
{
open Scamlparser        (* The type token is defined in parser.mli *)
open Printf
open Ast
exception Eof

let create_hashtable size init =
	let tbl = Hashtbl.create size in
		List.iter (fun (key, data) -> Hashtbl.add tbl key data) init;
		tbl

(*type state_t = 
	| State_main 
	| State_set*)

let keyword_table = 
	create_hashtable 16 [
		("if", IF);
		("then", THEN);
		("else", ELSE);
		("let", LET);
		("in", IN);
		("cons", CONS);
		("head", HEAD);
		("tail", TAIL);
		("strcomp", STRCOMP);
		("strapp", STRAPP);
		("set", TYPE(Set_type));
		("string", TYPE(String_type));
		("int", TYPE(Int_type));
		("bool", TYPE(Bool_type));
	] 
} 

let digit = ['0'-'9']
let alpha = ['a'-'z']+

rule main = parse
      [' ' '\t' '\n'] { main lexbuf }
    | digit+ as lxm  { printf "digit %s\n" lxm; INT(int_of_string lxm) }
    | '"' ((['a'-'z']+ ) as str) '"'  { printf "string %s\n" str; WORD str}
    | '"' ':' '"'   {printf "empty string"; EMPTY_WORD}
    | alpha as var	 
    	{ try
    		let token= Hashtbl.find keyword_table var in
    		printf "token %s\n" var;token 
    	  with Not_found ->                        
    	   	printf "Var %s\n" var; VAR var }	
    | "=="		     {printf "eq\n" ; EQ }
    | ':'			 {printf "typeof\n" ; TYPEOF }
    | '='			 {printf "ass\n"; ASS }
    | ','       {printf "comma\n"; COMMA}
    | '+'			 {printf "plus \n"; PLUS }
    | '-'			 {printf "min\n"; MINUS }
    | '('			 {printf "lp\n"; LP }
    | ')' 			 {printf "rp\n"; RP }
    | '{'			 { printf "lb\n" ; LB}
    | '}'      {printf "rb\n" ; RB}
    | ";;" 			 { printf "end\n" ; END }
    | eof 			 { printf "eof\n"; EOF; }
(*
{
let main2 () =
	let cin =
		if Array.length Sys.argv > 1
		then open_in Sys.argv.(1)
		else stdin
	in
	try
		let lexbuf = Lexing.from_channel cin in
			main lexbuf
	with Eof -> print_endline "Eof"; EOF
;;

let _ = Printexc.print main2 ()
}*)