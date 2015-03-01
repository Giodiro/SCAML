let union (first:set second:set):set = 
    if (seteq first {}) then (if (seteq second {}) then {} else (union second {}))
                     else (cons (head first) (union (tail first) second))
;;

let prefix(s:set pre:string):set = 
    if (seteq s {}) then {}
    else (cons (strapp pre (head s)) (prefix (tail s) pre))
;;

let perm (s:set size:int):set =
    if (== size 1) then s else
    let help (remainingStart:set size:int ):set = 
        if (seteq remainingStart {}) then {} else
        (union (prefix (perm s (- size 1)) (head remainingStart))
               (help (tail remainingStart) size))
    in (help s size)
;;

let concatenate(s1:set s2:set):set = 
    if (seteq s1 {}) then {} else
    (union (prefix s2 (head s1))
           (concatenate (tail s1) s2))
;;

let restrict (ins:set num:int):set = 
    if (== num 0) then {}
    else (if (seteq ins {}) then {}
          else (cons (head ins) (restrict (tail ins) (- num 1))))
;;

(restrict (sort (concatenate arg0 (perm {"a", "b", "c"} 2))) maxoutput);;