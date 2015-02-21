%{
	open Ast
%}

%token IF THEN ELSE 
%token LET IN ASS END TYPEOF
%token CONS HEAD TAIL STRCOMP STRAPP
%token EQ PLUS MINUS 
%token LP RP LB RB
%token COMMA EMPTY_WORD
%token EOF
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
 | /* empty */     				{ Empty }
 | top_level EOF				{ $1 }//Wrong!
 | main top_level EOF			{ $2 }//Wrong!
;
top_level:
 | global_def					{ $1 }
 | expr END						{ $1 }
;

arg_list:
 | /* empty */					{ [] }
 | arg_list VAR TYPEOF TYPE		{ Binding($2, $4) :: $1}

glob_def:
 | LET VAR LP arg_list RP TYPEOF TYPE ASS expr END	
								{ Func_Glob_Binding(Binding($2, $7), $4, $9) }
 | LET VAR TYPEOF TYPE ASS EXPR END
								{ Func_Glob_Binding(Binding($2, $4), $6) }
;