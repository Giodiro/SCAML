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
%token <Ast.myType> TYPE 
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
 | /* empty */     				{ [] }
 | main top_level EOF			{ $2::$1 }
;
top_level:
 | glob_def						{ $1 }
 | expr END						{ $1 }
;

arg_list:
 | /* empty */					{ [] }
 | arg_list VAR TYPEOF TYPE		{ Binding($2, $4) :: $1}

glob_def:
 | LET VAR LP arg_list RP TYPEOF TYPE ASS expr END	
								{ Func_Glob_Binding(Binding($2, $7), $4, $9) }
 | LET VAR TYPEOF TYPE ASS expr END
								{ Var_Glob_Binding(Binding($2, $4), $6) }
;

local_def:
 | LET VAR LP arg_list RP TYPEOF TYPE ASS expr IN expr 
 								{ Func_Loc_Binding(Binding($2, $7), $4, $9, $11) }
 | LET VAR TYPEOF TYPE ASS expr IN expr 
 								{ Var_Loc_Binding(Binding ($2, $4), $6, $8) }

expr:
 | aexpr 						{ $1 }
 | local_def 					{ $1 }
 | IF aexpr THEN aexpr ELSE aexpr { If($2, $4, $6) }
 | LP expr list_aexpr RP 		{ Application($2, $3) }

aexpr:
 | LP expr RP 					{ Expr($2) }
 | VAR 							{ Var($1) }
 | LB word_list RB				{ Set($2) }
 | INT 							{ Int($1) }
 | STRING 						{ String($1) }
 | CONS 						{ Built_In (Cons) }
 | HEAD							{ Built_In (Head) }
 | TAIL							{ Built_In (Tail) }
 | STRCOMP						{ Built_In (Strcomp) }
 | STRAPP						{ Built_In (Strapp) }
 | EQ 							{ Built_In (Eq) }
 | PLUS							{ Built_In (Plus) }
 | MINUS						{ Built_In (Minus) }

list_aexpr:
 | /* empty */					{ [] }
 | list_aexpr aexpr 			{ $2::$1 }

word_list:
 | /* empty */					{ [] }
 | word_list COMMA word   		{ $3::$1 }

word:
 | WORD 						{ Non_Empty_Word($1) }
 | EMPTY_WORD 					{ Empty_Word }








