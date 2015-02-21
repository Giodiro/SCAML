%{
	open Ast
%}

%token IF THEN ELSE 
%token LET IN ASS END TYPEOF
%token CONS HEAD TAIL STRCOMP STRAPP
%token EQ PLUS MINUS 
%token LP RP LB RB
%token COMMA EMPTY_WORD
%token <string> TYPE 
%token <int> INT 
%token <string> VAR
%token <string> WORD 
%token <string> STRING
%right IF THEN ELSE
%left EQUALS
%left PLUS MINUS
%nonassoc LP RP LB RB
%start main
%type <Ast.program> main
%%
main:
 | /* empty */     { Empty }