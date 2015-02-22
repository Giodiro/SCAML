type token =
  | IF
  | THEN
  | ELSE
  | LET
  | IN
  | ASS
  | END
  | TYPEOF
  | CONS
  | HEAD
  | TAIL
  | STRCOMP
  | STRAPP
  | EQ
  | PLUS
  | MINUS
  | LP
  | RP
  | LB
  | RB
  | COMMA
  | EMPTY_WORD
  | EOF
  | TYPE of (Ast.myType)
  | INT of (int)
  | VAR of (string)
  | WORD of (string)
  | STRING of (string)

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program
