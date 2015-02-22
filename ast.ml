type myType =
	| Int_type
	| String_type
	| Set_type
	| Bool_type

type binding = 
	{ 
	  name_type : def ;
	  value 	: expr;
	}

type def = 
	| Binding of string * myType

type program = 
	| Program of list top_level
  
type top_level =
  	| Definition of global_def
  	| Expression of expr

type global_def =
	| Func_Glob_Binding of def * (list def) * expr
	| Var_Glob_Binding of def * expr

type local_def = 
	| Func_Loc_Binding of def * (list def) * expr * expr
	| Var_Loc_Binding of def * expr * expr

type expr = 
 	| Atomic_expr of aexpr 
 	| Local_def of local_def
 	| If of aexpr * aexpr * aexpr
 	| Application of expr * (list aexpr)

type aexpr = 
	| Expr of expr
	| Var of string 
	| Set of list word 
	| Int of int 
	| String of string
	| Built_In of built_in 

type word = 
	| Non_Empty_Word of string
	| Empty_Word 

type built_in = 
	| Cons
	| Head
	| Tail
	| Eq
	| Plus
	| Minus
	| Strcomp
	| Strapp
	