exception Error

type token = 
  | WORD of (
# 15 "scamlparser.mly"
       (string)
# 8 "scamlparser.ml"
)
  | VAR of (
# 14 "scamlparser.mly"
       (string)
# 13 "scamlparser.ml"
)
  | TYPEOF
  | TYPE of (
# 12 "scamlparser.mly"
       (Ast.myType)
# 19 "scamlparser.ml"
)
  | THEN
  | TAIL
  | STRING of (
# 16 "scamlparser.mly"
       (string)
# 26 "scamlparser.ml"
)
  | STRCOMP
  | STRAPP
  | RP
  | RB
  | PLUS
  | MINUS
  | LP
  | LET
  | LB
  | INT of (
# 13 "scamlparser.mly"
       (int)
# 40 "scamlparser.ml"
)
  | IN
  | IF
  | HEAD
  | EQ
  | EOF
  | END
  | EMPTY_WORD
  | ELSE
  | CONS
  | COMMA
  | ASS

and _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState75
  | MenhirState71
  | MenhirState66
  | MenhirState63
  | MenhirState54
  | MenhirState52
  | MenhirState51
  | MenhirState49
  | MenhirState47
  | MenhirState39
  | MenhirState37
  | MenhirState34
  | MenhirState32
  | MenhirState28
  | MenhirState23
  | MenhirState22
  | MenhirState13
  | MenhirState8
  | MenhirState0


# 1 "scamlparser.mly"
  
	open Ast

# 87 "scamlparser.ml"
let _eRR =
  Error

let rec _menhir_run41 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_arg_list -> (
# 14 "scamlparser.mly"
       (string)
# 94 "scamlparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TYPEOF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv279 * _menhir_state * 'tv_arg_list) * (
# 14 "scamlparser.mly"
       (string)
# 106 "scamlparser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | TYPE _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv275 * _menhir_state * 'tv_arg_list) * (
# 14 "scamlparser.mly"
       (string)
# 116 "scamlparser.ml"
            )) = Obj.magic _menhir_stack in
            let (_v : (
# 12 "scamlparser.mly"
       (Ast.myType)
# 121 "scamlparser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv273 * _menhir_state * 'tv_arg_list) * (
# 14 "scamlparser.mly"
       (string)
# 128 "scamlparser.ml"
            )) = Obj.magic _menhir_stack in
            let (_4 : (
# 12 "scamlparser.mly"
       (Ast.myType)
# 133 "scamlparser.ml"
            )) = _v in
            ((let ((_menhir_stack, _menhir_s, _1), _2) = _menhir_stack in
            let _v : 'tv_arg_list = 
# 35 "scamlparser.mly"
                             ( Binding(_2, _4) :: _1)
# 139 "scamlparser.ml"
             in
            _menhir_goto_arg_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv274)) : 'freshtv276)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv277 * _menhir_state * 'tv_arg_list) * (
# 14 "scamlparser.mly"
       (string)
# 149 "scamlparser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv278)) : 'freshtv280)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv281 * _menhir_state * 'tv_arg_list) * (
# 14 "scamlparser.mly"
       (string)
# 160 "scamlparser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv282)

and _menhir_goto_top_level : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_top_level -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv271 * _menhir_state * 'tv_top_level) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | EOF ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | EQ ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | HEAD ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | IF ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | INT _v ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | LB ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | LET ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | LP ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | MINUS ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | PLUS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | STRAPP ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | STRCOMP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | STRING _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | TAIL ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | VAR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75) : 'freshtv272)

and _menhir_goto_glob_def : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glob_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv269) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_glob_def) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv267) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_1 : 'tv_glob_def) = _v in
    ((let _v : 'tv_top_level = 
# 29 "scamlparser.mly"
                 ( _1 )
# 223 "scamlparser.ml"
     in
    _menhir_goto_top_level _menhir_env _menhir_stack _menhir_s _v) : 'freshtv268)) : 'freshtv270)

and _menhir_goto_list_aexpr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_list_aexpr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv265 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_list_aexpr) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | RP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv261 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_list_aexpr) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv259 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_list_aexpr) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, _2), _, _3) = _menhir_stack in
        let _v : 'tv_expr = 
# 55 "scamlparser.mly"
                           ( Application(_2, _3) )
# 245 "scamlparser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv260)) : 'freshtv262)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv263 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_list_aexpr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv264)) : 'freshtv266)

and _menhir_run49 : _menhir_env -> (((('ttv_tail * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 259 "scamlparser.ml"
)) * _menhir_state * 'tv_arg_list) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 263 "scamlparser.ml"
)) * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | EQ ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | HEAD ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | IF ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | INT _v ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | LB ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | LET ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | LP ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | MINUS ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | PLUS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | STRAPP ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | STRCOMP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | STRING _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | TAIL ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | VAR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49

and _menhir_goto_local_def : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_local_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv257) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_local_def) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv255) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_1 : 'tv_local_def) = _v in
    ((let _v : 'tv_expr = 
# 53 "scamlparser.mly"
                  ( _1 )
# 317 "scamlparser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv256)) : 'freshtv258)

and _menhir_run37 : _menhir_env -> ((('ttv_tail * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 324 "scamlparser.ml"
)) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 328 "scamlparser.ml"
)) * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | EQ ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | HEAD ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | IF ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | INT _v ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
    | LB ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | LET ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | LP ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | MINUS ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | PLUS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | STRAPP ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | STRCOMP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | STRING _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
    | TAIL ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | VAR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState37

and _menhir_run29 : _menhir_env -> ('ttv_tail * _menhir_state) * _menhir_state * 'tv_expr -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv253 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    ((let ((_menhir_stack, _menhir_s), _, _2) = _menhir_stack in
    let _v : 'tv_aexpr = 
# 59 "scamlparser.mly"
                   ( Expr(_2) )
# 379 "scamlparser.ml"
     in
    _menhir_goto_aexpr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv254)

and _menhir_goto_arg_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_arg_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv233 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 392 "scamlparser.ml"
        )) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv229 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 402 "scamlparser.ml"
            )) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | TYPEOF ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv225 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 412 "scamlparser.ml"
                )) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | TYPE _v ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv221 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 422 "scamlparser.ml"
                    )) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
                    let (_v : (
# 12 "scamlparser.mly"
       (Ast.myType)
# 427 "scamlparser.ml"
                    )) = _v in
                    ((let _menhir_stack = (_menhir_stack, _v) in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | ASS ->
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((('freshtv217 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 438 "scamlparser.ml"
                        )) * _menhir_state * 'tv_arg_list) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 442 "scamlparser.ml"
                        )) = Obj.magic _menhir_stack in
                        ((let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        match _tok with
                        | CONS ->
                            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState47
                        | EQ ->
                            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState47
                        | HEAD ->
                            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState47
                        | IF ->
                            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState47
                        | INT _v ->
                            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
                        | LB ->
                            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState47
                        | LET ->
                            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState47
                        | LP ->
                            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState47
                        | MINUS ->
                            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState47
                        | PLUS ->
                            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState47
                        | STRAPP ->
                            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState47
                        | STRCOMP ->
                            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState47
                        | STRING _v ->
                            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
                        | TAIL ->
                            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState47
                        | VAR _v ->
                            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47) : 'freshtv218)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((('freshtv219 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 488 "scamlparser.ml"
                        )) * _menhir_state * 'tv_arg_list) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 492 "scamlparser.ml"
                        )) = Obj.magic _menhir_stack in
                        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv220)) : 'freshtv222)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv223 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 503 "scamlparser.ml"
                    )) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv224)) : 'freshtv226)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv227 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 514 "scamlparser.ml"
                )) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv228)) : 'freshtv230)
        | VAR _v ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv231 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 527 "scamlparser.ml"
            )) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv232)) : 'freshtv234)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv251 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 536 "scamlparser.ml"
        )) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv247 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 546 "scamlparser.ml"
            )) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | TYPEOF ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv243 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 556 "scamlparser.ml"
                )) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | TYPE _v ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv239 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 566 "scamlparser.ml"
                    )) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
                    let (_v : (
# 12 "scamlparser.mly"
       (Ast.myType)
# 571 "scamlparser.ml"
                    )) = _v in
                    ((let _menhir_stack = (_menhir_stack, _v) in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | ASS ->
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((('freshtv235 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 582 "scamlparser.ml"
                        )) * _menhir_state * 'tv_arg_list) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 586 "scamlparser.ml"
                        )) = Obj.magic _menhir_stack in
                        ((let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        match _tok with
                        | CONS ->
                            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState71
                        | EQ ->
                            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState71
                        | HEAD ->
                            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState71
                        | IF ->
                            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState71
                        | INT _v ->
                            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
                        | LB ->
                            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState71
                        | LET ->
                            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState71
                        | LP ->
                            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState71
                        | MINUS ->
                            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState71
                        | PLUS ->
                            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState71
                        | STRAPP ->
                            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState71
                        | STRCOMP ->
                            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState71
                        | STRING _v ->
                            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
                        | TAIL ->
                            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState71
                        | VAR _v ->
                            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71) : 'freshtv236)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((('freshtv237 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 632 "scamlparser.ml"
                        )) * _menhir_state * 'tv_arg_list) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 636 "scamlparser.ml"
                        )) = Obj.magic _menhir_stack in
                        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv238)) : 'freshtv240)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv241 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 647 "scamlparser.ml"
                    )) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv242)) : 'freshtv244)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv245 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 658 "scamlparser.ml"
                )) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv246)) : 'freshtv248)
        | VAR _v ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv249 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 671 "scamlparser.ml"
            )) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv250)) : 'freshtv252)
    | _ ->
        _menhir_fail ()

and _menhir_goto_word : _menhir_env -> 'ttv_tail -> 'tv_word -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv215 * 'tv_word_list) = Obj.magic _menhir_stack in
    let (_v : 'tv_word) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv213 * 'tv_word_list) = Obj.magic _menhir_stack in
    let (_3 : 'tv_word) = _v in
    ((let (_menhir_stack, _1) = _menhir_stack in
    let _v : 'tv_word_list = 
# 86 "scamlparser.mly"
                            ( _3::_1 )
# 690 "scamlparser.ml"
     in
    _menhir_goto_word_list _menhir_env _menhir_stack _v) : 'freshtv214)) : 'freshtv216)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_non_empty_list_aexpr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_non_empty_list_aexpr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv211 * _menhir_state * 'tv_non_empty_list_aexpr) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState54
    | EQ ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState54
    | HEAD ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState54
    | INT _v ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _v
    | LB ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState54
    | LP ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState54
    | MINUS ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState54
    | PLUS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState54
    | STRAPP ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState54
    | STRCOMP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState54
    | STRING _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _v
    | TAIL ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState54
    | VAR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _v
    | RP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv209 * _menhir_state * 'tv_non_empty_list_aexpr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
        let _v : 'tv_list_aexpr = 
# 76 "scamlparser.mly"
                          ( _1 )
# 740 "scamlparser.ml"
         in
        _menhir_goto_list_aexpr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv210)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState54) : 'freshtv212)

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState52 | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv159 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RP ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState28
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28) : 'freshtv160)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv163 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 769 "scamlparser.ml"
        )) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 773 "scamlparser.ml"
        )) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IN ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv161 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 787 "scamlparser.ml"
            )) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 791 "scamlparser.ml"
            )) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)) : 'freshtv164)
    | MenhirState37 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv167 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 800 "scamlparser.ml"
        )) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 804 "scamlparser.ml"
        )) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv165 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 810 "scamlparser.ml"
        )) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 814 "scamlparser.ml"
        )) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _menhir_s), _2), _4), _, _6), _, _8) = _menhir_stack in
        let _v : 'tv_local_def = 
# 48 "scamlparser.mly"
         ( Var_Loc_Binding(Binding (_2, _4), _6, _8) )
# 820 "scamlparser.ml"
         in
        _menhir_goto_local_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv166)) : 'freshtv168)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv171 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 828 "scamlparser.ml"
        )) * _menhir_state * 'tv_arg_list) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 832 "scamlparser.ml"
        )) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IN ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv169 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 846 "scamlparser.ml"
            )) * _menhir_state * 'tv_arg_list) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 850 "scamlparser.ml"
            )) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)) : 'freshtv172)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv175 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 859 "scamlparser.ml"
        )) * _menhir_state * 'tv_arg_list) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 863 "scamlparser.ml"
        )) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv173 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 869 "scamlparser.ml"
        )) * _menhir_state * 'tv_arg_list) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 873 "scamlparser.ml"
        )) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let ((((((_menhir_stack, _menhir_s), _2), _, _4), _7), _, _9), _, _11) = _menhir_stack in
        let _v : 'tv_local_def = 
# 46 "scamlparser.mly"
         ( Func_Loc_Binding(Binding(_2, _7), _4, _9, _11) )
# 879 "scamlparser.ml"
         in
        _menhir_goto_local_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv174)) : 'freshtv176)
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv183 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CONS ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | EQ ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | HEAD ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | INT _v ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | LB ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | LP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv181) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState51 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CONS ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | EQ ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | HEAD ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | IF ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | INT _v ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
            | LB ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | LET ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | LP ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | MINUS ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | PLUS ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | RP ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv179 * _menhir_state) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState52 in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv177 * _menhir_state) = Obj.magic _menhir_stack in
                let (_ : _menhir_state) = _menhir_s in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                let _v : 'tv_list_aexpr = 
# 75 "scamlparser.mly"
              ( [] )
# 938 "scamlparser.ml"
                 in
                _menhir_goto_list_aexpr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv178)) : 'freshtv180)
            | STRAPP ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | STRCOMP ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | STRING _v ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
            | TAIL ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | VAR _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState52) : 'freshtv182)
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | PLUS ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | RP ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | STRAPP ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | STRCOMP ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | STRING _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | TAIL ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | VAR _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51) : 'freshtv184)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv191 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 980 "scamlparser.ml"
        )) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 984 "scamlparser.ml"
        )) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv187 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 994 "scamlparser.ml"
            )) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 998 "scamlparser.ml"
            )) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv185 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 1005 "scamlparser.ml"
            )) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 1009 "scamlparser.ml"
            )) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), _2), _4), _, _6) = _menhir_stack in
            let _v : 'tv_glob_def = 
# 41 "scamlparser.mly"
        ( Var_Glob_Binding(Binding(_2, _4), _6) )
# 1015 "scamlparser.ml"
             in
            _menhir_goto_glob_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv186)) : 'freshtv188)
        | IN ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv189 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 1027 "scamlparser.ml"
            )) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 1031 "scamlparser.ml"
            )) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)) : 'freshtv192)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv199 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 1040 "scamlparser.ml"
        )) * _menhir_state * 'tv_arg_list) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 1044 "scamlparser.ml"
        )) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv195 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 1054 "scamlparser.ml"
            )) * _menhir_state * 'tv_arg_list) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 1058 "scamlparser.ml"
            )) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv193 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 1065 "scamlparser.ml"
            )) * _menhir_state * 'tv_arg_list) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 1069 "scamlparser.ml"
            )) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (((((_menhir_stack, _menhir_s), _2), _, _4), _7), _, _9) = _menhir_stack in
            let _v : 'tv_glob_def = 
# 39 "scamlparser.mly"
        ( Func_Glob_Binding(Binding(_2, _7), _4, _9) )
# 1075 "scamlparser.ml"
             in
            _menhir_goto_glob_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv194)) : 'freshtv196)
        | IN ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv197 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 1087 "scamlparser.ml"
            )) * _menhir_state * 'tv_arg_list) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 1091 "scamlparser.ml"
            )) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv198)) : 'freshtv200)
    | MenhirState0 | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv207 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv203 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv201 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : 'tv_top_level = 
# 30 "scamlparser.mly"
                 ( _1 )
# 1111 "scamlparser.ml"
             in
            _menhir_goto_top_level _menhir_env _menhir_stack _menhir_s _v) : 'freshtv202)) : 'freshtv204)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv205 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv206)) : 'freshtv208)
    | _ ->
        _menhir_fail ()

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | VAR _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv155 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 14 "scamlparser.mly"
       (string)
# 1136 "scamlparser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv141 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 1147 "scamlparser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            _menhir_reduce14 _menhir_env (Obj.magic _menhir_stack) MenhirState39) : 'freshtv142)
        | TYPEOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv151 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 1156 "scamlparser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | TYPE _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv147 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 1166 "scamlparser.ml"
                )) = Obj.magic _menhir_stack in
                let (_v : (
# 12 "scamlparser.mly"
       (Ast.myType)
# 1171 "scamlparser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | ASS ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv143 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 1182 "scamlparser.ml"
                    )) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 1186 "scamlparser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | CONS ->
                        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState13
                    | EQ ->
                        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState13
                    | HEAD ->
                        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState13
                    | IF ->
                        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState13
                    | INT _v ->
                        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
                    | LB ->
                        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState13
                    | LET ->
                        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState13
                    | LP ->
                        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState13
                    | MINUS ->
                        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState13
                    | PLUS ->
                        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState13
                    | STRAPP ->
                        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState13
                    | STRCOMP ->
                        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState13
                    | STRING _v ->
                        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
                    | TAIL ->
                        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState13
                    | VAR _v ->
                        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13) : 'freshtv144)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv145 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 1232 "scamlparser.ml"
                    )) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 1236 "scamlparser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)) : 'freshtv148)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv149 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 1247 "scamlparser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv150)) : 'freshtv152)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv153 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 1258 "scamlparser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)) : 'freshtv156)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv157 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)

and _menhir_reduce14 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_arg_list = 
# 34 "scamlparser.mly"
                   ( [] )
# 1275 "scamlparser.ml"
     in
    _menhir_goto_arg_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_word_list : _menhir_env -> 'ttv_tail -> 'tv_word_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv139 * _menhir_state) * 'tv_word_list) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMMA ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv131 * 'tv_word_list) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EMPTY_WORD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv123) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv121) = Obj.magic _menhir_stack in
            ((let _v : 'tv_word = 
# 91 "scamlparser.mly"
                   ( Empty_Word )
# 1302 "scamlparser.ml"
             in
            _menhir_goto_word _menhir_env _menhir_stack _v) : 'freshtv122)) : 'freshtv124)
        | WORD _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv127) = Obj.magic _menhir_stack in
            let (_v : (
# 15 "scamlparser.mly"
       (string)
# 1311 "scamlparser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv125) = Obj.magic _menhir_stack in
            let (_1 : (
# 15 "scamlparser.mly"
       (string)
# 1319 "scamlparser.ml"
            )) = _v in
            ((let _v : 'tv_word = 
# 90 "scamlparser.mly"
              ( Non_Empty_Word(_1) )
# 1324 "scamlparser.ml"
             in
            _menhir_goto_word _menhir_env _menhir_stack _v) : 'freshtv126)) : 'freshtv128)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv129 * 'tv_word_list) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv130)) : 'freshtv132)
    | RB ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv135 * _menhir_state) * 'tv_word_list) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv133 * _menhir_state) * 'tv_word_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _2) = _menhir_stack in
        let _v : 'tv_aexpr = 
# 61 "scamlparser.mly"
                      ( Set(_2) )
# 1343 "scamlparser.ml"
         in
        _menhir_goto_aexpr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv134)) : 'freshtv136)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv137 * _menhir_state) * 'tv_word_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)) : 'freshtv140)

and _menhir_run23 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | EQ ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | HEAD ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | IF ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | INT _v ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | LB ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | LET ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | LP ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | MINUS ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | PLUS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | STRAPP ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | STRCOMP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | STRING _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | TAIL ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | VAR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23

and _menhir_goto_main : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 22 "scamlparser.mly"
      (Ast.program)
# 1398 "scamlparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv115 * _menhir_state * 'tv_top_level) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 22 "scamlparser.mly"
      (Ast.program)
# 1409 "scamlparser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv113 * _menhir_state * 'tv_top_level) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let (_2 : (
# 22 "scamlparser.mly"
      (Ast.program)
# 1417 "scamlparser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
        let _v : (
# 22 "scamlparser.mly"
      (Ast.program)
# 1423 "scamlparser.ml"
        ) = 
# 26 "scamlparser.mly"
                    ( _1::_2 )
# 1427 "scamlparser.ml"
         in
        _menhir_goto_main _menhir_env _menhir_stack _menhir_s _v) : 'freshtv114)) : 'freshtv116)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv119) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 22 "scamlparser.mly"
      (Ast.program)
# 1437 "scamlparser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv117) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_1 : (
# 22 "scamlparser.mly"
      (Ast.program)
# 1445 "scamlparser.ml"
        )) = _v in
        (Obj.magic _1 : 'freshtv118)) : 'freshtv120)
    | _ ->
        _menhir_fail ()

and _menhir_goto_aexpr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_aexpr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 | MenhirState75 | MenhirState71 | MenhirState63 | MenhirState8 | MenhirState52 | MenhirState47 | MenhirState49 | MenhirState13 | MenhirState37 | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv87 * _menhir_state * 'tv_aexpr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv85 * _menhir_state * 'tv_aexpr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
        let _v : 'tv_expr = 
# 52 "scamlparser.mly"
               ( _1 )
# 1464 "scamlparser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv86)) : 'freshtv88)
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv93 * _menhir_state) * _menhir_state * 'tv_aexpr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | THEN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv89 * _menhir_state) * _menhir_state * 'tv_aexpr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CONS ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState32
            | EQ ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState32
            | HEAD ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState32
            | INT _v ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
            | LB ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState32
            | LP ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState32
            | MINUS ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState32
            | PLUS ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState32
            | STRAPP ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState32
            | STRCOMP ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState32
            | STRING _v ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
            | TAIL ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState32
            | VAR _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32) : 'freshtv90)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv91 * _menhir_state) * _menhir_state * 'tv_aexpr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)) : 'freshtv94)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv99 * _menhir_state) * _menhir_state * 'tv_aexpr) * _menhir_state * 'tv_aexpr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ELSE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv95 * _menhir_state) * _menhir_state * 'tv_aexpr) * _menhir_state * 'tv_aexpr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CONS ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | EQ ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | HEAD ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | INT _v ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
            | LB ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | LP ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | MINUS ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | PLUS ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | STRAPP ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | STRCOMP ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | STRING _v ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
            | TAIL ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | VAR _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34) : 'freshtv96)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv97 * _menhir_state) * _menhir_state * 'tv_aexpr) * _menhir_state * 'tv_aexpr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)) : 'freshtv100)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv103 * _menhir_state) * _menhir_state * 'tv_aexpr) * _menhir_state * 'tv_aexpr) * _menhir_state * 'tv_aexpr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv101 * _menhir_state) * _menhir_state * 'tv_aexpr) * _menhir_state * 'tv_aexpr) * _menhir_state * 'tv_aexpr) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, _2), _, _4), _, _6) = _menhir_stack in
        let _v : 'tv_expr = 
# 54 "scamlparser.mly"
                                  ( If(_2, _4, _6) )
# 1574 "scamlparser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv102)) : 'freshtv104)
    | MenhirState54 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv107 * _menhir_state * 'tv_non_empty_list_aexpr) * _menhir_state * 'tv_aexpr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv105 * _menhir_state * 'tv_non_empty_list_aexpr) * _menhir_state * 'tv_aexpr) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _1), _, _2) = _menhir_stack in
        let _v : 'tv_non_empty_list_aexpr = 
# 81 "scamlparser.mly"
                               ( _2::_1 )
# 1586 "scamlparser.ml"
         in
        _menhir_goto_non_empty_list_aexpr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv106)) : 'freshtv108)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv111 * _menhir_state * 'tv_aexpr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv109 * _menhir_state * 'tv_aexpr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
        let _v : 'tv_non_empty_list_aexpr = 
# 80 "scamlparser.mly"
               ( [_1] )
# 1598 "scamlparser.ml"
         in
        _menhir_goto_non_empty_list_aexpr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv110)) : 'freshtv112)
    | _ ->
        _menhir_fail ()

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv47 * _menhir_state * 'tv_top_level) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv49 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 1617 "scamlparser.ml"
        )) * _menhir_state * 'tv_arg_list) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 1621 "scamlparser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv51 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 1630 "scamlparser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv53 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 1639 "scamlparser.ml"
        )) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 1643 "scamlparser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState54 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv55 * _menhir_state * 'tv_non_empty_list_aexpr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState52 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv59 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv61 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 1667 "scamlparser.ml"
        )) * _menhir_state * 'tv_arg_list) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 1671 "scamlparser.ml"
        )) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv63 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 1680 "scamlparser.ml"
        )) * _menhir_state * 'tv_arg_list) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 1684 "scamlparser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv65 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 1693 "scamlparser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState37 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv67 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 1702 "scamlparser.ml"
        )) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 1706 "scamlparser.ml"
        )) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv69 * _menhir_state) * _menhir_state * 'tv_aexpr) * _menhir_state * 'tv_aexpr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv71 * _menhir_state) * _menhir_state * 'tv_aexpr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState28 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv73 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv75 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv77 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv79 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 1740 "scamlparser.ml"
        )) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 1744 "scamlparser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv81 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv83) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv84)

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "scamlparser.mly"
       (string)
# 1761 "scamlparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv45) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_1 : (
# 14 "scamlparser.mly"
       (string)
# 1771 "scamlparser.ml"
    )) = _v in
    ((let _v : 'tv_aexpr = 
# 60 "scamlparser.mly"
              ( Var(_1) )
# 1776 "scamlparser.ml"
     in
    _menhir_goto_aexpr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv46)

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv43) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_aexpr = 
# 66 "scamlparser.mly"
              ( Built_In (Tail) )
# 1789 "scamlparser.ml"
     in
    _menhir_goto_aexpr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv44)

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "scamlparser.mly"
       (string)
# 1796 "scamlparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv41) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_1 : (
# 16 "scamlparser.mly"
       (string)
# 1806 "scamlparser.ml"
    )) = _v in
    ((let _v : 'tv_aexpr = 
# 63 "scamlparser.mly"
                ( String(_1) )
# 1811 "scamlparser.ml"
     in
    _menhir_goto_aexpr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv42)

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv39) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_aexpr = 
# 67 "scamlparser.mly"
                ( Built_In (Strcomp) )
# 1824 "scamlparser.ml"
     in
    _menhir_goto_aexpr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv40)

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv37) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_aexpr = 
# 68 "scamlparser.mly"
               ( Built_In (Strapp) )
# 1837 "scamlparser.ml"
     in
    _menhir_goto_aexpr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv38)

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv35) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_aexpr = 
# 70 "scamlparser.mly"
              ( Built_In (Plus) )
# 1850 "scamlparser.ml"
     in
    _menhir_goto_aexpr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv36)

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv33) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_aexpr = 
# 71 "scamlparser.mly"
              ( Built_In (Minus) )
# 1863 "scamlparser.ml"
     in
    _menhir_goto_aexpr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv34)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | EQ ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | HEAD ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | IF ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | INT _v ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | LB ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | LET ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | LP ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | MINUS ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | PLUS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | STRAPP ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | STRCOMP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | STRING _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | TAIL ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | VAR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8

and _menhir_run59 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | VAR _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv29 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 14 "scamlparser.mly"
       (string)
# 1920 "scamlparser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv15 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 1931 "scamlparser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            _menhir_reduce14 _menhir_env (Obj.magic _menhir_stack) MenhirState66) : 'freshtv16)
        | TYPEOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv25 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 1940 "scamlparser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | TYPE _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv21 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 1950 "scamlparser.ml"
                )) = Obj.magic _menhir_stack in
                let (_v : (
# 12 "scamlparser.mly"
       (Ast.myType)
# 1955 "scamlparser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | ASS ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv17 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 1966 "scamlparser.ml"
                    )) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 1970 "scamlparser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | CONS ->
                        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState63
                    | EQ ->
                        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState63
                    | HEAD ->
                        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState63
                    | IF ->
                        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState63
                    | INT _v ->
                        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
                    | LB ->
                        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState63
                    | LET ->
                        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState63
                    | LP ->
                        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState63
                    | MINUS ->
                        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState63
                    | PLUS ->
                        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState63
                    | STRAPP ->
                        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState63
                    | STRCOMP ->
                        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState63
                    | STRING _v ->
                        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
                    | TAIL ->
                        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState63
                    | VAR _v ->
                        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63) : 'freshtv18)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv19 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 2016 "scamlparser.ml"
                    )) * (
# 12 "scamlparser.mly"
       (Ast.myType)
# 2020 "scamlparser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv20)) : 'freshtv22)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv23 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 2031 "scamlparser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)) : 'freshtv26)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv27 * _menhir_state) * (
# 14 "scamlparser.mly"
       (string)
# 2042 "scamlparser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)) : 'freshtv30)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv13) = Obj.magic _menhir_stack in
    ((let _v : 'tv_word_list = 
# 85 "scamlparser.mly"
                   ( [] )
# 2063 "scamlparser.ml"
     in
    _menhir_goto_word_list _menhir_env _menhir_stack _v) : 'freshtv14)

and _menhir_run21 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 13 "scamlparser.mly"
       (int)
# 2070 "scamlparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv11) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_1 : (
# 13 "scamlparser.mly"
       (int)
# 2080 "scamlparser.ml"
    )) = _v in
    ((let _v : 'tv_aexpr = 
# 62 "scamlparser.mly"
              ( Int(_1) )
# 2085 "scamlparser.ml"
     in
    _menhir_goto_aexpr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv12)

and _menhir_run22 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | EQ ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | HEAD ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | INT _v ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | LB ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | LP ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | MINUS ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | PLUS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | STRAPP ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | STRCOMP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | STRING _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | TAIL ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | VAR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22

and _menhir_run24 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv9) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_aexpr = 
# 65 "scamlparser.mly"
              ( Built_In (Head) )
# 2135 "scamlparser.ml"
     in
    _menhir_goto_aexpr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv10)

and _menhir_run25 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv7) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_aexpr = 
# 69 "scamlparser.mly"
             ( Built_In (Eq) )
# 2148 "scamlparser.ml"
     in
    _menhir_goto_aexpr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv8)

and _menhir_run74 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv5) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : (
# 22 "scamlparser.mly"
      (Ast.program)
# 2160 "scamlparser.ml"
    ) = 
# 25 "scamlparser.mly"
             ( [] )
# 2164 "scamlparser.ml"
     in
    _menhir_goto_main _menhir_env _menhir_stack _menhir_s _v) : 'freshtv6)

and _menhir_run26 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv3) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_aexpr = 
# 64 "scamlparser.mly"
              ( Built_In (Cons) )
# 2177 "scamlparser.ml"
     in
    _menhir_goto_aexpr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv4)

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
      }

and main : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 22 "scamlparser.mly"
      (Ast.program)
# 2196 "scamlparser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = Obj.magic () in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_error = false;
        }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = () in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CONS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | EOF ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | EQ ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | HEAD ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | IF ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | INT _v ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | LB ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LET ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LP ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | MINUS ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | PLUS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | STRAPP ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | STRCOMP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | STRING _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | TAIL ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | VAR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv2))



