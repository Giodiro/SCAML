let contains (inset:set elem:string):bool = 
	if (== inset {}) then false
	else (if (== elem (head inset)) then true
		  else (contains (tail inset) elem))
;;

let union (first:set second:set):set = 
	if (== first {}) then second
	else (let current:string = (head first) in
			if (contains second current) then (union (tail first) second)
			else (union (tail first) (cons current second)))
;;
let unionone:set = { "hell", "is", "scheme" };;
let uniontwo:set = { "yeah", "ocaml" };;

(union unionone uniontwo);;