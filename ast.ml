type myBool =
  | T | F
  
type myType =
	| Int_type
	| String_type
	| Set_type
	| Bool_type
  | Func_type of myType list
  
type word = 
	| Non_Empty_Word of string
	| Empty_Word 

type built_in = 
	| Cons
	| Head
	| Tail
	| Inteq
	| Wordeq
	| Seteq
	| Plus
	| Minus
	| Strcomp
	| Strapp
  	| Sort
  	| Uniq

type def = 
{ 
  name : string;
  _type : myType;
}

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
 	| If of expr * expr * expr
 	| Application of expr * (expr list)
and aexpr = 
	| Expr of expr
  | Closure of closure  (* This type is only visible to the interpreter *)
	| Var of string 
	| Set of word list 
	| Int of int
  | Bool of myBool
	| Word of word
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
 	parameters	:	def list   ;
 	mutable env :	environment;
 	lambda		  :	expr    ;
}

exception Unbound of string (* the variable that is unbound *)
exception HeadOfEmptySet
exception TailOfEmptySet
exception NotApplicable
exception WrongNumberOfArguments of int * int (* expected number of args * actual number of args *)
exception WrongType of myType (* expected_type *)
exception SyntaxError of int * int * string
exception ParseError of int * int * string
exception UsageException of string
