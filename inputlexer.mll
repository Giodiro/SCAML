{
  open Inputparser
}

let digit = ['0'-'9']
let alpha = ['a'-'z']+

rule main = parse
    [' ' '\t']    { main lexbuf }
  | ['\n']        { main lexbuf }
  | digit+ as d   { INT(int_of_string d) }
  | alpha as str  { WORD str }
  | ':'           { EMPTY_WORD }
  | '{'           { LB }
  | '}'           { RB }
  | ','           { COMMA }
  | eof           { EOF }