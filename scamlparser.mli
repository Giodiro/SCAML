(* The type of tokens. *)
type token = 
  | WORD of (string)
  | VAR of (string)
  | TYPEOF
  | TYPE of (Ast.myType)
  | THEN
  | TAIL
  | STRING of (string)
  | STRCOMP
  | STRAPP
  | RP
  | RB
  | PLUS
  | MINUS
  | LP
  | LET
  | LB
  | INT of (int)
  | IN
  | IF
  | HEAD
  | EQ
  | EOF
  | END
  | EMPTY_WORD
  | ELSE
  | CONS
  | COMMA
  | ASS

(* This exception is raised by the monolithic API functions. *)
exception Error

(* The monolithic API. *)
val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.program)

