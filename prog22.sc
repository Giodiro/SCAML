let setone:set = { "hell", "is", "scheme", "scheme" };;
let settwo:set = { "scheme", "yeah", "ocaml", "scheme" };;

let union (first:set second:set):set = 
	if (== first {}) then (if (== second {}) then {} else (union second {}))
					 else (cons (head first) (union (tail first) second))
;;

(union setone settwo);;