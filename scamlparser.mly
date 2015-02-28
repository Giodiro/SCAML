%{
	open Ast
%}

%token IF THEN ELSE 
%token LET IN ASS END TYPEOF
%token CONS HEAD TAIL STRCOMP STRAPP SORT UNIQ
%token INTEQ WORDEQ SETEQ PLUS MINUS 
%token LP RP LB RB
%token COMMA EMPTY_WORD
%token FALSE TRUE
%token EOF
%token RARROW
%token <Ast.myType> TYPE 
%token <int> INT 
%token <string> VAR
%token <string> WORD
%right IF THEN ELSE
%left INTEQ WORDEQ SETEQ
%left PLUS MINUS
%nonassoc LP RP LB RB
%start main
%type <Ast.top_level list> main
%%
main:
 | EOF   				{ [] }
 | top_level main 		{ $1::$2 }
;
top_level:
 | glob_def						{ Definition $1 }
 | expr END						{ print_endline "expr"; Expression $1 }
;

glob_def:
 | LET VAR LP arg_list RP TYPEOF TYPE ASS expr END	
								{ Func_Glob_Binding({name = $2; mtype = $7;}, $4, $9) }
 | LET VAR TYPEOF TYPE ASS expr END
								{ Var_Glob_Binding({name = $2; mtype = $4;}, $6) }
;

local_def:
 | LET VAR LP arg_list RP TYPEOF TYPE ASS expr IN expr 
 								{ Func_Loc_Binding({name = $2; mtype = $7;}, $4, $9, $11) }
 | LET VAR TYPEOF TYPE ASS expr IN expr 
 								{ Var_Loc_Binding({name = $2; mtype = $4;}, $6, $8) }
;

expr:
 | aexpr                        { Atomic_expr $1 }
 | local_def                    { Local_def $1 }
 | IF expr THEN expr ELSE expr  { If($2, $4, $6) }
 | LP expr list_expr RP         { Application($2, $3) }
;

aexpr:
 | LP expr RP                   { Expr($2) }
 | VAR                          { Var($1) }
 | LB word_list RB              { Set($2) }
 | INT 							{ Int($1) }
 | WORD 						{ Word (Non_Empty_Word($1)) }
 | EMPTY_WORD                   { Word Empty_Word }
 | FALSE						{ Bool (F) }
 | TRUE							{ Bool (T) }
 | CONS 						{ Built_In (Cons) }
 | HEAD							{ Built_In (Head) }
 | TAIL							{ Built_In (Tail) }
 | STRCOMP                      { Built_In (Strcomp) }
 | STRAPP						{ Built_In (Strapp) }
 | INTEQ 						{ Built_In (Inteq) }
 | WORDEQ                       { Built_In (Wordeq) }
 | SETEQ                        { Built_In (Seteq) }
 | PLUS							{ Built_In (Plus) }
 | MINUS						{ Built_In (Minus) }
 | SORT                         { Built_In (Sort) }
 | UNIQ                         { Built_In (Uniq) }
;

arg_list:
 | /* empty */                  { [] }
 | VAR TYPEOF mtype arg_list     { ({name=$1; mtype=$3}) :: $4}
;

mtype:
 | TYPE                         { $1 }
 | func_type                    { Func_type ($1) }

func_type:
 | TYPE RARROW TYPE             { [$1; $3] }
 | TYPE RARROW func_type        { $1 :: $3 }

list_expr:
 | LP RP                        { [] }
 | non_empty_list_expr          { $1 }
;

non_empty_list_expr:
 | expr                         { [$1] }
 | expr non_empty_list_expr     { $1::$2 }
;

word_list:
 | /* empty */                  { [] }
 | word                         { [$1] }
 | word COMMA word_list         { $1::$3}
;

word:
 | WORD 						{ Non_Empty_Word($1) }
 | EMPTY_WORD                   { Empty_Word }
;
