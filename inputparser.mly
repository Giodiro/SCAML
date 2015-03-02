%{
  open Ast
%}
 
%token <string*Ast.err_location> WORD
%token <int*Ast.err_location> INT
%token <Ast.err_location> LB RB COMMA
%token <Ast.err_location> EMPTY_WORD
%token <Ast.err_location> EOF
%start main
%type <Ast.aexpr list> main
%%
main:
  | EOF                 { [] }
  | input main          { $1::$2 }
;
input:
  | LB word_list RB     { Set($2, $1) }
  | INT                 { Int((fst $1), (snd $1)) }
;

word_list:
 | /* empty */          { [] }
 | word                 { [$1] }
 | word COMMA word_list { $1::$3}
;

word:
 | WORD 			    { Non_Empty_Word((fst $1)) }
 | EMPTY_WORD 			{ Empty_Word }
;