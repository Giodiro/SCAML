(* File scamllexer.mll *)
{
open Scamlparser        (* The type token is defined in parser.mli *)
open Ast

let line_num = ref 1

exception Syntax_error of string

let syntax_error lnum cnum msg tok = raise (Syntax_error 
   (msg ^ " on line: " ^ 
   (string_of_int lnum) ^
   " char: " ^ (string_of_int cnum) ^
   " while reading token " ^ tok))

let create_hashtable size init =
	let tbl = Hashtbl.create size in
		List.iter (fun (key, data) -> Hashtbl.add tbl key data) init;
		tbl

(*type state_t = 
	| State_main 
	| State_set*)

let keyword_table = 
	create_hashtable 32 [
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
		("false", FALSE);
		("true", TRUE);
	] 
} 

let digit = ['0'-'9']
let alpha = ['a'-'z' 'A'-'Z']
let id = ['a'-'z' 'A'-'Z'] ['a'-'z' 'A'-'Z' '0'-'9']*

rule main = parse
      [' ' '\t'] { main lexbuf }
    | ['\n']     { Lexing.new_line lexbuf; main lexbuf }
    | digit+ as lxm  {  INT(int_of_string lxm) }
    | '"' ((['a'-'z']+) as str) '"'  {  WORD str}
    | '"' ':' '"'   { EMPTY_WORD}
    | id as var	 
    	{ try
    		let token= Hashtbl.find keyword_table var in
    		token 
    	  with Not_found ->                        
    	   	 VAR var }	
    | "=="		     { EQ }
    | ':'			 { TYPEOF }
    | '='			 { ASS }
    | ','       { COMMA}
    | '+'			 { PLUS }
    | '-'			 { MINUS }
    | '('			 { LP }
    | ')' 			 { RP }
    | '{'			 {  LB}
    | '}'      { RB}
    | ";;" 			 {  END }
    | _         { let curr = lexbuf.Lexing.lex_curr_p in
                    syntax_error curr.Lexing.pos_lnum
                                 (curr.Lexing.pos_cnum - curr.Lexing.pos_bol)
                                 "Syntax error" 
                                 (Lexing.lexeme lexbuf)}
    | eof 			 { EOF }
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