let inputset:set = { "pawel", "lol", "looool" };;
let postfixwith:string = "hello";;

let map (s:set f:string->string):set =
    if (seteq s {}) then {}
    else (cons (f (head s)) (map (tail s) f))
;;

let help (str:string):string =
    (strapp str postfixwith)
;;
(map inputset help);;