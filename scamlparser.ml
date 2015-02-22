type token =
  | IF
  | THEN
  | ELSE
  | LET
  | IN
  | ASS
  | END
  | TYPEOF
  | CONS
  | HEAD
  | TAIL
  | STRCOMP
  | STRAPP
  | EQ
  | PLUS
  | MINUS
  | LP
  | RP
  | LB
  | RB
  | COMMA
  | EMPTY_WORD
  | EOF
  | TYPE of (Ast.myType)
  | INT of (int)
  | VAR of (string)
  | WORD of (string)
  | STRING of (string)

open Parsing;;
let _ = parse_error;;
# 2 "scamlparser.mly"
	open Ast
# 36 "scamlparser.ml"
let yytransl_const = [|
  257 (* IF *);
  258 (* THEN *);
  259 (* ELSE *);
  260 (* LET *);
  261 (* IN *);
  262 (* ASS *);
  263 (* END *);
  264 (* TYPEOF *);
  265 (* CONS *);
  266 (* HEAD *);
  267 (* TAIL *);
  268 (* STRCOMP *);
  269 (* STRAPP *);
  270 (* EQ *);
  271 (* PLUS *);
  272 (* MINUS *);
  273 (* LP *);
  274 (* RP *);
  275 (* LB *);
  276 (* RB *);
  277 (* COMMA *);
  278 (* EMPTY_WORD *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  279 (* TYPE *);
  280 (* INT *);
  281 (* VAR *);
  282 (* WORD *);
  283 (* STRING *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\002\000\005\000\005\000\003\000\003\000\
\006\000\006\000\004\000\004\000\004\000\004\000\007\000\007\000\
\007\000\007\000\007\000\007\000\007\000\007\000\007\000\007\000\
\007\000\007\000\007\000\008\000\008\000\009\000\009\000\010\000\
\010\000\000\000"

let yylen = "\002\000\
\000\000\003\000\001\000\002\000\000\000\004\000\010\000\007\000\
\011\000\008\000\001\000\001\000\006\000\004\000\003\000\001\000\
\003\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\000\000\002\000\000\000\003\000\001\000\
\001\000\002\000"

let yydefred = "\000\000\
\001\000\000\000\000\000\000\000\000\000\020\000\021\000\022\000\
\023\000\024\000\025\000\026\000\027\000\000\000\030\000\018\000\
\016\000\019\000\000\000\003\000\000\000\012\000\011\000\000\000\
\000\000\000\000\000\000\000\000\000\000\002\000\004\000\000\000\
\000\000\000\000\005\000\000\000\015\000\000\000\017\000\000\000\
\000\000\000\000\000\000\000\000\005\000\014\000\029\000\033\000\
\032\000\031\000\000\000\000\000\000\000\000\000\000\000\000\000\
\013\000\000\000\000\000\000\000\000\000\000\000\000\000\008\000\
\000\000\006\000\000\000\000\000\010\000\000\000\000\000\000\000\
\000\000\000\000\007\000\000\000\009\000"

let yydgoto = "\002\000\
\003\000\019\000\020\000\021\000\043\000\022\000\023\000\038\000\
\029\000\050\000"

let yysindex = "\019\000\
\000\000\000\000\002\255\091\255\003\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\053\255\000\000\000\000\
\000\000\000\000\033\000\000\000\029\255\000\000\000\000\053\255\
\038\255\014\255\017\255\025\255\004\255\000\000\000\000\025\255\
\091\255\021\255\000\000\015\255\000\000\072\255\000\000\238\254\
\042\255\040\255\240\254\027\255\000\000\000\000\000\000\000\000\
\000\000\000\000\091\255\053\255\043\255\044\255\047\255\016\255\
\000\000\000\255\035\255\048\255\053\255\065\255\053\255\000\000\
\049\255\000\000\056\255\051\255\000\000\053\255\069\255\032\255\
\053\255\053\255\000\000\071\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\079\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\110\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\242\255\047\000\000\000\253\255\000\000\
\000\000\000\000"

let yytablesize = 137
let yytable = "\028\000\
\025\000\053\000\004\000\048\000\063\000\005\000\064\000\049\000\
\054\000\032\000\006\000\007\000\008\000\009\000\010\000\011\000\
\012\000\013\000\014\000\001\000\015\000\034\000\044\000\039\000\
\040\000\016\000\017\000\026\000\018\000\041\000\035\000\045\000\
\030\000\062\000\047\000\031\000\074\000\058\000\075\000\033\000\
\054\000\036\000\037\000\042\000\051\000\052\000\067\000\057\000\
\069\000\055\000\059\000\060\000\061\000\004\000\070\000\072\000\
\027\000\065\000\076\000\077\000\063\000\006\000\007\000\008\000\
\009\000\010\000\011\000\012\000\013\000\014\000\066\000\015\000\
\068\000\071\000\073\000\074\000\016\000\017\000\034\000\018\000\
\006\000\007\000\008\000\009\000\010\000\011\000\012\000\013\000\
\024\000\046\000\015\000\056\000\000\000\000\000\000\000\016\000\
\017\000\000\000\018\000\006\000\007\000\008\000\009\000\010\000\
\011\000\012\000\013\000\024\000\000\000\015\000\000\000\000\000\
\000\000\000\000\016\000\017\000\000\000\018\000\028\000\028\000\
\028\000\028\000\028\000\028\000\028\000\028\000\028\000\000\000\
\028\000\000\000\000\000\000\000\000\000\028\000\028\000\000\000\
\028\000"

let yycheck = "\014\000\
\004\000\018\001\001\001\022\001\005\001\004\001\007\001\026\001\
\025\001\024\000\009\001\010\001\011\001\012\001\013\001\014\001\
\015\001\016\001\017\001\001\000\019\001\008\001\008\001\020\001\
\021\001\024\001\025\001\025\001\027\001\033\000\017\001\017\001\
\000\000\018\001\038\000\007\001\005\001\052\000\007\001\002\001\
\025\001\025\001\018\001\023\001\003\001\006\001\061\000\051\000\
\063\000\023\001\008\001\008\001\006\001\001\001\006\001\070\000\
\004\001\023\001\073\000\074\000\005\001\009\001\010\001\011\001\
\012\001\013\001\014\001\015\001\016\001\017\001\023\001\019\001\
\008\001\023\001\006\001\005\001\024\001\025\001\000\000\027\001\
\009\001\010\001\011\001\012\001\013\001\014\001\015\001\016\001\
\017\001\018\001\019\001\045\000\255\255\255\255\255\255\024\001\
\025\001\255\255\027\001\009\001\010\001\011\001\012\001\013\001\
\014\001\015\001\016\001\017\001\255\255\019\001\255\255\255\255\
\255\255\255\255\024\001\025\001\255\255\027\001\009\001\010\001\
\011\001\012\001\013\001\014\001\015\001\016\001\017\001\255\255\
\019\001\255\255\255\255\255\255\255\255\024\001\025\001\255\255\
\027\001"

let yynames_const = "\
  IF\000\
  THEN\000\
  ELSE\000\
  LET\000\
  IN\000\
  ASS\000\
  END\000\
  TYPEOF\000\
  CONS\000\
  HEAD\000\
  TAIL\000\
  STRCOMP\000\
  STRAPP\000\
  EQ\000\
  PLUS\000\
  MINUS\000\
  LP\000\
  RP\000\
  LB\000\
  RB\000\
  COMMA\000\
  EMPTY_WORD\000\
  EOF\000\
  "

let yynames_block = "\
  TYPE\000\
  INT\000\
  VAR\000\
  WORD\000\
  STRING\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    Obj.repr(
# 25 "scamlparser.mly"
                       ( [] )
# 210 "scamlparser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.program) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'top_level) in
    Obj.repr(
# 26 "scamlparser.mly"
                        ( _2::_1 )
# 218 "scamlparser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'glob_def) in
    Obj.repr(
# 29 "scamlparser.mly"
                 ( _1 )
# 225 "scamlparser.ml"
               : 'top_level))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 30 "scamlparser.mly"
                 ( _1 )
# 232 "scamlparser.ml"
               : 'top_level))
; (fun __caml_parser_env ->
    Obj.repr(
# 34 "scamlparser.mly"
                   ( [] )
# 238 "scamlparser.ml"
               : 'arg_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'arg_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Ast.myType) in
    Obj.repr(
# 35 "scamlparser.mly"
                             ( Binding(_2, _4) :: _1)
# 247 "scamlparser.ml"
               : 'arg_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 8 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 6 : 'arg_list) in
    let _7 = (Parsing.peek_val __caml_parser_env 3 : Ast.myType) in
    let _9 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 39 "scamlparser.mly"
        ( Func_Glob_Binding(Binding(_2, _7), _4, _9) )
# 257 "scamlparser.ml"
               : 'glob_def))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : Ast.myType) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 41 "scamlparser.mly"
        ( Var_Glob_Binding(Binding(_2, _4), _6) )
# 266 "scamlparser.ml"
               : 'glob_def))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 9 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 7 : 'arg_list) in
    let _7 = (Parsing.peek_val __caml_parser_env 4 : Ast.myType) in
    let _9 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _11 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 46 "scamlparser.mly"
         ( Func_Loc_Binding(Binding(_2, _7), _4, _9, _11) )
# 277 "scamlparser.ml"
               : 'local_def))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 4 : Ast.myType) in
    let _6 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _8 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 48 "scamlparser.mly"
         ( Var_Loc_Binding(Binding (_2, _4), _6, _8) )
# 287 "scamlparser.ml"
               : 'local_def))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'aexpr) in
    Obj.repr(
# 51 "scamlparser.mly"
               ( _1 )
# 294 "scamlparser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'local_def) in
    Obj.repr(
# 52 "scamlparser.mly"
                  ( _1 )
# 301 "scamlparser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'aexpr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'aexpr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'aexpr) in
    Obj.repr(
# 53 "scamlparser.mly"
                                  ( If(_2, _4, _6) )
# 310 "scamlparser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'list_aexpr) in
    Obj.repr(
# 54 "scamlparser.mly"
                           ( Application(_2, _3) )
# 318 "scamlparser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 57 "scamlparser.mly"
                   ( Expr(_2) )
# 325 "scamlparser.ml"
               : 'aexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 58 "scamlparser.mly"
              ( Var(_1) )
# 332 "scamlparser.ml"
               : 'aexpr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'word_list) in
    Obj.repr(
# 59 "scamlparser.mly"
                      ( Set(_2) )
# 339 "scamlparser.ml"
               : 'aexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 60 "scamlparser.mly"
              ( Int(_1) )
# 346 "scamlparser.ml"
               : 'aexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 61 "scamlparser.mly"
                ( String(_1) )
# 353 "scamlparser.ml"
               : 'aexpr))
; (fun __caml_parser_env ->
    Obj.repr(
# 62 "scamlparser.mly"
              ( Built_In (Cons) )
# 359 "scamlparser.ml"
               : 'aexpr))
; (fun __caml_parser_env ->
    Obj.repr(
# 63 "scamlparser.mly"
              ( Built_In (Head) )
# 365 "scamlparser.ml"
               : 'aexpr))
; (fun __caml_parser_env ->
    Obj.repr(
# 64 "scamlparser.mly"
              ( Built_In (Tail) )
# 371 "scamlparser.ml"
               : 'aexpr))
; (fun __caml_parser_env ->
    Obj.repr(
# 65 "scamlparser.mly"
                ( Built_In (Strcomp) )
# 377 "scamlparser.ml"
               : 'aexpr))
; (fun __caml_parser_env ->
    Obj.repr(
# 66 "scamlparser.mly"
               ( Built_In (Strapp) )
# 383 "scamlparser.ml"
               : 'aexpr))
; (fun __caml_parser_env ->
    Obj.repr(
# 67 "scamlparser.mly"
             ( Built_In (Eq) )
# 389 "scamlparser.ml"
               : 'aexpr))
; (fun __caml_parser_env ->
    Obj.repr(
# 68 "scamlparser.mly"
              ( Built_In (Plus) )
# 395 "scamlparser.ml"
               : 'aexpr))
; (fun __caml_parser_env ->
    Obj.repr(
# 69 "scamlparser.mly"
              ( Built_In (Minus) )
# 401 "scamlparser.ml"
               : 'aexpr))
; (fun __caml_parser_env ->
    Obj.repr(
# 72 "scamlparser.mly"
                   ( [] )
# 407 "scamlparser.ml"
               : 'list_aexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'list_aexpr) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'aexpr) in
    Obj.repr(
# 73 "scamlparser.mly"
                       ( _2::_1 )
# 415 "scamlparser.ml"
               : 'list_aexpr))
; (fun __caml_parser_env ->
    Obj.repr(
# 76 "scamlparser.mly"
                   ( [] )
# 421 "scamlparser.ml"
               : 'word_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'word_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'word) in
    Obj.repr(
# 77 "scamlparser.mly"
                            ( _3::_1 )
# 429 "scamlparser.ml"
               : 'word_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 80 "scamlparser.mly"
              ( Non_Empty_Word(_1) )
# 436 "scamlparser.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 81 "scamlparser.mly"
                   ( Empty_Word )
# 442 "scamlparser.ml"
               : 'word))
(* Entry main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.program)
