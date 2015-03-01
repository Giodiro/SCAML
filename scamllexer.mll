(* File scamllexer.mll *)
{
open Scamlparser        (* The type token is defined in parser.mli *)
open Ast

let curr_loc = ref {lnum=0;cnum=0;token=""}

let syntax_error lnum cnum msg tok =
    raise (SyntaxError (lnum, cnum, tok))

let create_hashtable size init =
  let tbl = Hashtbl.create size in
    List.iter (fun (key, data) -> Hashtbl.add tbl key data) init;
    tbl

let loc_from_lexbuf lexbuf =
  let curr = lexbuf.Lexing.lex_curr_p in
   {
      lnum=curr.Lexing.pos_lnum;
      cnum=(curr.Lexing.pos_cnum - curr.Lexing.pos_bol);
      token=(Lexing.lexeme lexbuf);
   }
    
let keyword_table = 
  create_hashtable 32 [
    ("if", IF(!curr_loc));
    ("then", THEN(!curr_loc));
    ("else", ELSE(!curr_loc));
    ("let", LET(!curr_loc));
    ("in", IN(!curr_loc));
    ("cons", CONS(!curr_loc));
    ("head", HEAD(!curr_loc));
    ("tail", TAIL(!curr_loc));
    ("strcomp", STRCOMP(!curr_loc));
    ("strapp", STRAPP(!curr_loc));
    ("sort", SORT(!curr_loc));
    ("uniq", UNIQ(!curr_loc));
    ("set", TYPE(Set_type,(!curr_loc)));
    ("string", TYPE(String_type,(!curr_loc)));
    ("int", TYPE(Int_type,(!curr_loc)));
    ("bool", TYPE(Bool_type,(!curr_loc)));
    ("false", FALSE(!curr_loc));
    ("true", TRUE(!curr_loc));
    ("wordeq", WORDEQ(!curr_loc));
    ("seteq", SETEQ(!curr_loc))
  ] 
} 

let digit = ['0'-'9']
let alpha = ['a'-'z' 'A'-'Z']
let id = ['a'-'z' 'A'-'Z'] ['a'-'z' 'A'-'Z' '0'-'9']*

rule main = parse
      [' ' '\t'] { main lexbuf }
    | ['\n']     { Lexing.new_line lexbuf; main lexbuf }
    | digit+ as lxm  {  INT((int_of_string lxm),(loc_from_lexbuf lexbuf)) }
    | '"' ((['a'-'z']+) as str) '"'  { WORD (str, (loc_from_lexbuf lexbuf))}
    | '"' ':' '"'   { EMPTY_WORD (loc_from_lexbuf lexbuf) }
    | id as var   
      { try
          let token = Hashtbl.find keyword_table var in
          (curr_loc := loc_from_lexbuf lexbuf; token )
        with Not_found -> VAR (var,(loc_from_lexbuf lexbuf))}
    | ':'      { TYPEOF(loc_from_lexbuf lexbuf) }
    | '='      { ASS(loc_from_lexbuf lexbuf) }
    | ','      { COMMA(loc_from_lexbuf lexbuf) }
    | '+'      { PLUS(loc_from_lexbuf lexbuf) }
    | '-'      { MINUS(loc_from_lexbuf lexbuf) }
    | '('      { LP(loc_from_lexbuf lexbuf) }
    | ')'      { RP(loc_from_lexbuf lexbuf) }
    | '{'      { LB(loc_from_lexbuf lexbuf) }
    | '}'      { RB(loc_from_lexbuf lexbuf) }
    | "=="     { INTEQ(loc_from_lexbuf lexbuf) }
    | "->"     { RARROW(loc_from_lexbuf lexbuf) }
    | ";;"     { END(loc_from_lexbuf lexbuf) }
    | _        { let curr = lexbuf.Lexing.lex_curr_p in
                  syntax_error curr.Lexing.pos_lnum
                              (curr.Lexing.pos_cnum - curr.Lexing.pos_bol)
                              "Syntax error" 
                              (Lexing.lexeme lexbuf)}
    | eof      { EOF(loc_from_lexbuf lexbuf) }
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