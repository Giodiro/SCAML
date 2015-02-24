type myBool =
  | T | F
  
type myType =
	| Int_type
	| String_type
	| Set_type
	| Bool_type
	| Word_type		(*we use the other types so to specify types of variables but never say a word is of type word -> do we need it*)
  
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
  
  

  

type def = 
	| Binding of string * myType

type top_level =
  | Definition of global_def
  | Expression of expr
and global_def =
	| Func_Glob_Binding of def * (def list) * expr
	| Var_Glob_Binding of def * expr
and local_def = 
	| Func_Loc_Binding of def * (def list) * expr * expr
	| Var_Loc_Binding of def * expr * expr
and expr = 
 	| Atomic_expr of aexpr 
 	| Local_def of local_def
 	| If of aexpr * aexpr * aexpr
 	| Application of expr * (aexpr list)
and aexpr = 
	| Expr of expr
  | Closure of closure  (* This type is only visible to the interpreter *)
	| Var of string 
	| Set of word list 
	| Int of int 
  | Word of word
  | Bool of myBool
	| String of string
	| Built_In of built_in 
and environment =
 | Global_env of binding list
 | Whatever of (binding list) * environment
(*and frame = { frame_binding : binding list }*)
and binding = 
{ 
	name_type : def  ;
	value 	  : aexpr;
}
and closure = 
{
 	parameters:	def list   ;
 	env 		  :	environment;
 	lambda		:	expr    ;
}