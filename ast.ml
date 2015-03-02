type myBool =
  | T | F
  
type myType =
  | Int_type
  | String_type
  | Set_type
  | Bool_type
  | Func_type of myType list

type err_location =
{
  lnum : int;
  cnum : int;
  token : string;
}
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
  mtype : myType;
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
  | Logic_expr of logic_expr * err_location
  | Application of expr * (expr list)
and aexpr = 
  | Expr of expr
  | Closure of closure  (* This type is only visible to the interpreter *)
  | Var of string * err_location
  | Set of (word list) * err_location
  | Int of int * err_location
  | Bool of myBool * err_location
  | Word of word * err_location
  | Built_In of built_in * err_location
and logic_expr = 
  | And_expr of expr * expr
  | Or_expr of expr * expr
  | Not_expr of expr 
and environment =
  | Global_env of binding list
  | Whatever of (binding list) * environment
  
and binding = 
{ 
  name_type : def  ;
  value     : aexpr;
}
and closure = 
{
   parameters  :  def list   ;
   mutable env :  environment;
   lambda      :  expr    ;
}

exception Unbound of string * err_location (* the variable that is unbound *)
exception HeadOfEmptySet
exception TailOfEmptySet
exception NotApplicable
exception WrongNumberOfArguments of int * int * err_location(* expected number of args * actual number of args *)
exception WrongType of myType (* expectedmtype *)
exception ParseError of int * int * string
exception UsageException of string
exception SyntaxError of string * bool * err_location
