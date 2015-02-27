%{
  open Ast
%}
 
%token <string> WORD
%token <int> INT
%token LB RB COMMA
%token EMPTY_WORD
%token EOF
%start main
%type <Ast.aexpr list> main
%%
main:
  | EOF           { [] }
  | input main    { $1::$2 }
;
input:
  | LB word_list RB { Set($2) }
  | INT             { Int($1) }
;

word_list:
 | /* empty */          { [] }
 | word                 { [$1] }
 | word COMMA word_list { $1::$3}
;

word:
 | WORD 						{ Non_Empty_Word($1) }
 | EMPTY_WORD 			{ Empty_Word }
;