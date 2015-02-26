let inputset:set = { "pawel", "lol", "looool" };;
let postfixwith:string = "hello";;

let postfix (iset:set appstr:string):set =
	if (== iset {}) then {}
	else (cons (strapp (head iset) appstr) (postfix (tail iset) appstr))
;;
(postfix inputset postfixwith);;