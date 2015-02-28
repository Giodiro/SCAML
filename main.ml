open Ast
open Interpreter

let parse_buf_exn lexbuf =
  try
    Scamlparser.main Scamllexer.main lexbuf
  with Parsing.Parse_error ->
    begin
      let curr = lexbuf.Lexing.lex_curr_p in
      let line = curr.Lexing.pos_lnum in
      let cnum = curr.Lexing.pos_cnum - curr.Lexing.pos_bol in
      let tok = Lexing.lexeme lexbuf in
      raise (Error (line,cnum,tok))
    end

(* return a list of bindings *)
let parse_input_exn lexbuf = 
  try
    Inputparser.main Inputlexer.main lexbuf
  with Parsing.Parse_error ->
    begin
      let curr = lexbuf.Lexing.lex_curr_p in
      let line = curr.Lexing.pos_lnum in
      let cnum = curr.Lexing.pos_cnum - curr.Lexing.pos_bol in
      let tok = Lexing.lexeme lexbuf in
      raise (Error (line,cnum,tok))
    end

let interpret_input () = 
  let lexbuf = Lexing.from_channel stdin and
      num_sets = (ref 0) and
      env = Global_env([]) in
    let result = parse_input_exn lexbuf in
      let rec bind_input env token arg_num = match token with
        | [] -> env
        | h::t -> 
          (match h with
            | Set(wl) as s -> (incr num_sets; 
                               bind_input 
                                (make_binding {name=("arg" ^ (string_of_int arg_num));_type=Set_type} s env)
                                t (arg_num + 1))
            | Int(x)  as  i -> bind_input 
                                (make_binding {name="maxoutput";_type=Int_type} i env)
                                t arg_num
            | _             -> bind_input env t arg_num)
      in let new_env = bind_input env result 0
      in make_binding {name="numarguments";_type=Int_type} (Int (!num_sets)) new_env
                
let main () =
  let program_name = if Array.length Sys.argv > 1
                     then Sys.argv.(1)
                     else raise (UsageException "No program was detected.")
  and start_env = (interpret_input ())
	in let lexbuf = Lexing.from_channel (open_in program_name) in
     try
      let result = parse_buf_exn lexbuf
      in interpret result start_env
    with Error (lnum, cnum, token) -> (print_string "Parse error on line ";
                                        print_int lnum; print_string " char:";
                                        print_int cnum; print_string " while reading token ";
                                        print_string token)
        | (Scamllexer.Syntax_error msg) -> print_endline msg
        | WrongType (t)  -> (print_string "Interpreter error: expected type ";
                             print_string (string_of_type t))
        | WrongNumberOfArguments (ex,ac) -> (print_string "Interpreter error: expected ";
                                             print_int ex; print_string " arguments. ";
                                             print_string "The function is not applicable to ";
                                             print_int ac; print_string " arguments.")
        | Unbound (s) -> (print_string "Interpreter error: variable ";
                          print_string s; print_string " is not bound.";)
;;

let _ = Printexc.print main ()