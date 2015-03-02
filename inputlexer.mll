{
  open Inputparser
  open Ast
  
let loc_from_lexbuf lexbuf =
  let curr = lexbuf.Lexing.lex_curr_p in
   {
      lnum=curr.Lexing.pos_lnum;
      cnum=(curr.Lexing.pos_cnum - curr.Lexing.pos_bol);
      token=(Lexing.lexeme lexbuf);
   }

}

let digit = ['0'-'9']
let alpha = ['a'-'z']+

rule main = parse
    [' ' '\t']    { main lexbuf }
  | ['\n']        { Lexing.new_line lexbuf; main lexbuf }
  | digit+ as d   { INT((int_of_string d), (loc_from_lexbuf lexbuf)) }
  | alpha as str  { WORD (str, (loc_from_lexbuf lexbuf)) }
  | ':'           { EMPTY_WORD (loc_from_lexbuf lexbuf) }
  | '{'           { LB (loc_from_lexbuf lexbuf) }
  | '}'           { RB (loc_from_lexbuf lexbuf) }
  | ','           { COMMA (loc_from_lexbuf lexbuf) }
  | eof           { EOF (loc_from_lexbuf lexbuf) }