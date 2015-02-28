let contains (inset:set elem:string):bool = 
	if (seteq inset {}) then false
	else (if (wordeq elem (head inset)) then true
		  else (contains (tail inset) elem))
;;

let union (first:set second:set):set = 
	if (seteq first {}) then second
	else (let current:int = (head first) in
			if (contains second current) then (union (tail first) second)
			else (union (tail first) (cons current second)))
;;
let unionone:set = { "hell", "is", "scheme" };;
let uniontwo:set = { "yeah", "ocaml" };;

(union unionone uniontwo);;