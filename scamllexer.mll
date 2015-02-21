(* File scamllexer.mll *)
{
(*open Scamlparser        (* The type token is defined in parser.mli *)*)
open Printf
exception Eof

let create_hashtable size init =
	let tbl = Hashtbl.create size in
		List.iter (fun (key, data) -> Hashtbl.add tbl key data) init;
		tbl
type token =
	| IF
	| THEN
	| ELSE
	| LET
	| IN
	| CONS
	| HEAD
	| TAIL
	| STRCOMP
	| STRAPP
	| TYPE of string
	| INT of int
	| VAR of string
	| WORD of string
	| STRING of string
	| TYPEOF 
	| LB
	| RB
	| LP
	| RP
	| EMPTY_WORD
	| COMMA
	| MIN
	| PLUS
	| EQ
	| ASS
	| END

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
		("set", TYPE "set");
		("string", TYPE "string");
		("int", TYPE "int");
		("bool", TYPE "bool");
	] 
}

let digit = ['0'-'9']
let alpha = ['a'-'z']+
let string = '"' ['a'-'z']* '"'

rule main = parse
      [' ' '\t']     
    | ['\n' ]  		 { main lexbuf }
    | digit+ as lxm  { printf "digit %s\n" lxm; INT(int_of_string lxm) }
    | string as str  { printf "string %s\n" str; STRING str}
    | alpha as var	 
    	{ try
    		let token= Hashtbl.find keyword_table var in
    		printf "token %s\n" var;token 
    	  with Not_found -> 
    	   	printf "Var %s\n" var; VAR var }	
    | "=="		     {printf "eq\n" ; EQ }
    | ':'			 { printf "typeof\n" ; TYPEOF }
    | '='			 {printf "ass\n"; ASS }
    | '+'			 {printf "plus \n"; PLUS }
    | '-'			 {printf "min\n"; MIN }
    | '('			 {printf "lp\n"; LP }
    | ')' 			 {printf "rp\n"; RP }
    | '{'			 { printf "lb\n" ;LB; set lexbuf }
    | ";;" 			 { printf "end\n" ; END }
    | eof 			 { printf "eof\n";raise Eof }
and set = parse
	  [' ' '\t']
    | ['\n' ]  		 { set lexbuf }
	| alpha as w 	 { printf "word %s\n" w;WORD w }
	| ','         	 { printf "commma\n"; COMMA }
	| ':'			 { printf "empty\n"; EMPTY_WORD }
	| '}'			 { printf "rb\n";RB; main lexbuf }

{
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
		try parse lexbuf
		with Eof -> ()

	let _ = Printexc.print main ()
}