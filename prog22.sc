let setone:set = { "hell", "is", "scheme", "scheme" };;
let settwo:set =  {"scheme", "yeah", "ocaml", "scheme" ;;

if (== 1 1) then gi:berigh;;

let union (first:set second:set):set = 
	if (== first {})  (if (== second {}) then {} else (union second {}))
					 else (cons (head first) (union (tail first) second))
;;

(union setone settwo);;