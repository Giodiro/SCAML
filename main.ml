open Ast
open Interpreter

(* 
  Calls parser and lexer on lexbuf, and returns parsed tokens.
  Raises Error on parsing error 
*)
let parse_exn lexbuf lexer parser = 
  try
    parser lexer lexbuf
  with Parsing.Parse_error ->
    begin
      let curr = lexbuf.Lexing.lex_curr_p in
      let line = curr.Lexing.pos_lnum in
      let cnum = curr.Lexing.pos_cnum - curr.Lexing.pos_bol in
      let tok = Lexing.lexeme lexbuf in
      raise (ParseError (line,cnum,tok))
    end

let pretty_print_error err msg = match err with
  | SyntaxError (lnum, cnum, token)
  | ParseError (lnum, cnum, token) -> (
      print_string msg;
      print_string " on line ";
      print_int lnum;
      print_string ", char ";
      print_int cnum;
      print_string " while reading token";
      print_string token)

(* interpret_input: token -> environment *)
let interpret_input parsed_token = 
  let num_sets = (ref 0) and
      env = Global_env([]) in
    let rec bind_input env token arg_num = match token with
      | [] -> env
      | h::t -> 
        (match h with
          | Set(wl) as s -> (* bind sets *) 
              (incr num_sets; 
               bind_input 
                (make_binding {name=("arg" ^ (string_of_int arg_num));mtype=Set_type} s env)
                t (arg_num + 1))
          | Int(x)  as  i -> (* bind max output size *)
              bind_input 
                (make_binding {name="maxoutput";mtype=Int_type} i env)  
                t arg_num
          | _  -> bind_input env t arg_num) (* ignore *)
    in let new_env = bind_input env parsed_token 0
    in make_binding {name="numarguments";mtype=Int_type} (Int (!num_sets)) new_env

let input_main () = 
  let lexbuf = Lexing.from_channel stdin in
  try
    let result = parse_exn lexbuf Inputlexer.main Inputparser.main
    in interpret_input result
  with
    | (ParseError (lnum, cnum, token)) as e -> 
        (pretty_print_error e "Parse error in input language ";
         failwith "")
    | (SyntaxError (lnum, cnum, token)) as e -> 
        (pretty_print_error e "Syntax error in input language ";
          failwith "")

let main () =
  let program_name = if Array.length Sys.argv > 1
                     then Sys.argv.(1)
                     else raise (UsageException "No program was detected.")
  and start_env = input_main ()
	in let lexbuf = Lexing.from_channel (open_in program_name) in
     try
      let result = parse_exn lexbuf Scamllexer.main Scamlparser.main
      in (Typechecker.type_check result (Typechecker.type_env_of_env start_env);
          interpret result start_env)
    with 
      | (ParseError (lnum, cnum, token)) as e -> 
          pretty_print_error e "Parse error "
      | (SyntaxError (lnum, cnum, token)) as e -> 
          pretty_print_error e "Syntax error "
      | (WrongType t)  -> (print_string "Interpreter error: expected type ";
                             print_string (string_of_type t))
      | WrongNumberOfArguments (ex,ac) -> (print_string "Interpreter error: expected ";
                                             print_int ex; print_string " arguments. ";
                                             print_string "The function is not applicable to ";
                                             print_int ac; print_string " arguments.")
      | Unbound (s) -> (print_string "Interpreter error: variable ";
                          print_string s; print_string " is not bound.";)
      | Failure (s) -> print_string "Error: exiting."
;;

let _ = Printexc.print main ()