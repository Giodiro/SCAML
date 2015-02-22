(* File scamllexer.mll *)
{
open Scamlparser        (* The type token is defined in parser.mli *)
open Printf
open Ast

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
      [' ' '\t']     
    | ['\n' ]  		 { main lexbuf }
    | digit+ as lxm  { printf "digit %s\n" lxm; INT(int_of_string lxm) }
    | '"' ((['a'-'z' ' ']* ':') as str) '"'  { printf "string %s\n" str; STRING str}
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
    | '{'			 { printf "lb\n" ; set lexbuf; LB}
    | ";;" 			 { printf "end\n" ; END }
    | eof 			 { printf "eof\n"; EOF }
and set = parse
	  [' ' '\t']
    | ['\n' ]  		 { set lexbuf }
	| alpha as w 	 { printf "word %s\n" w; set lexbuf; WORD w }
	| ','         	 { printf "commma\n"; set lexbuf; COMMA }
	| ':'			 { printf "empty\n"; set lexbuf; EMPTY_WORD }
	| '}'			 { printf "rb\n"; main lexbuf; RB }