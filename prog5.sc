let union (first:set second:set):set = 
    if (seteq first {}) then (if (seteq second {}) then {} else (union second {}))
                     else (cons (head first) (union (tail first) second))
;;

let postfix(s:set post:str):set = 
    if (seteq s {}) then {}
    else (cons (strapp post (head s)) (postfix (tail s) post))
;;

let perm (s:set size:int):set =
    if (== size 1) then set else
    let help (remainingStart:set size:int ):set = 
        if (seteq remainingStart {}) then {} else
        (union (postfix (perm s (- size 1)) (head remainingStart))
               (help (tail remainingStart) size))
    in (help s size)
;;