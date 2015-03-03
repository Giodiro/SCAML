%{
  open Ast
%}

%token <Ast.err_location> IF THEN ELSE 
%token <Ast.err_location> LET IN ASS END TYPEOF
%token <Ast.err_location> CONS HEAD TAIL STRCOMP STRAPP SORT UNIQ
%token <Ast.err_location> INTEQ WORDEQ SETEQ PLUS MINUS MULT DIV
%token <Ast.err_location> LP RP LB RB
%token <Ast.err_location> COMMA EMPTY_WORD
%token <Ast.err_location> FALSE TRUE
%token <Ast.err_location> AND OR NOT
%token <Ast.err_location> EOF
%token <Ast.err_location> RARROW
%token <Ast.myType*Ast.err_location> TYPE 
%token <int*Ast.err_location> INT 
%token <string*Ast.err_location> VAR
%token <string*Ast.err_location> WORD
%right IF THEN ELSE
%left INTEQ WORDEQ SETEQ
%left PLUS MINUS MULT DIV
%left AND OR
%nonassoc LP RP LB RB
%nonassoc NOT
%start main
%type <Ast.top_level list> main
%%
main:
 | EOF                { [] }
 | top_level main     { $1::$2 }
;
top_level:
 | glob_def           { Definition $1 }
 | expr END           { Expression $1 }
 | error END          { raise (SyntaxError ("", false, $2))}
;

glob_def:
 | LET VAR LP arg_list RP TYPEOF TYPE ASS expr END  
                { Func_Glob_Binding({name = (fst $2); mtype = (fst $7);}, $4, $9) }
 | LET VAR TYPEOF TYPE ASS expr END
                { Var_Glob_Binding({name = (fst $2); mtype = (fst $4);}, $6) }
 | LET VAR LP error RP TYPEOF TYPE ASS expr END
                { raise (SyntaxError ("", false, $3)) }
;

local_def:
 | LET VAR LP arg_list RP TYPEOF TYPE ASS expr IN expr 
                 { Func_Loc_Binding({name = (fst $2); mtype = (fst $7);}, $4, $9, $11) }
 | LET VAR LP error RP TYPEOF TYPE ASS expr IN expr 
                { raise (SyntaxError ("", false, $3)) }
 | LET VAR TYPEOF TYPE ASS expr IN expr 
                 { Var_Loc_Binding({name = (fst $2); mtype = (fst $4);}, $6, $8) }
;

expr:
 | aexpr                        { Atomic_expr $1 }
 | local_def                    { Local_def $1 }
 | IF expr THEN expr ELSE expr  { If($2, $4, $6) }
 | LP logic_expr RP             { Logic_expr ($2, $1) }
 | LP expr list_expr RP         { Application($2, $3) }
 | LP error RP                  { raise (SyntaxError ("", false, $1)) }
;

aexpr:
 | LP expr RP                   { Expr($2) }
 | LP error                     { raise (SyntaxError ("( might be unmatched", true, $1))}
 | error RP                     { raise (SyntaxError (") might be unmatched", true, $2))}
 | LP error RP                  { raise (SyntaxError ("", false, $1)) }
 | VAR                          { Var ((fst $1),(snd $1)) }
 | LB word_list RB              { Set($2,$1) }
 | LB error RB                  { raise (SyntaxError ("", false, $1)) }
 | LB error                     { raise (SyntaxError ("{ might be unmatched", true, $1)) } 
 | error RB                     { raise (SyntaxError ("} might be unmatched", true, $2)) }
 | INT                          { Int((fst $1),(snd $1)) }
 | WORD                         { Word ((Non_Empty_Word((fst $1))),(snd $1)) }
 | EMPTY_WORD                   { Word (Empty_Word, $1) }
 | FALSE                        { Bool (F, $1) }
 | TRUE                         { Bool (T, $1) }
 | CONS                         { Built_In ((Cons),$1) }
 | HEAD                         { Built_In ((Head),$1) }
 | TAIL                         { Built_In ((Tail),$1) }
 | STRCOMP                      { Built_In ((Strcomp),$1) }
 | STRAPP                       { Built_In ((Strapp),$1) }
 | INTEQ                        { Built_In ((Inteq),$1) }
 | WORDEQ                       { Built_In ((Wordeq),$1) }
 | SETEQ                        { Built_In ((Seteq),$1) }
 | PLUS                         { Built_In ((Plus),$1) }
 | MINUS                        { Built_In ((Minus),$1) }
 | MULT                         { Built_In ((Mult),$1) }
 | DIV                          { Built_In ((Division),$1) }
 | SORT                         { Built_In ((Sort),$1) }
 | UNIQ                         { Built_In ((Uniq),$1) }
;

logic_expr:
 | expr AND expr                { And_expr($1, $3) }
 | expr OR expr                 { Or_expr($1, $3) }
 | NOT expr                     { Not_expr($2) }
;

arg_list:
 | /* empty */                  { [] }
 | VAR TYPEOF mtype arg_list    { ({name=(fst $1); mtype=$3}) :: $4}
;

mtype:
 | TYPE                         { (fst $1) }
 | func_type                    { Func_type ($1) }

func_type:
 | TYPE RARROW TYPE             { [(fst $1); (fst $3)] }
 | TYPE RARROW func_type        { (fst $1) :: $3 }

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
 | WORD                         { Non_Empty_Word((fst $1)) }
 | EMPTY_WORD                   { Empty_Word }
;
