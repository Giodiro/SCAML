let union (first:set second:set):set = 
    if (seteq first {}) then (if (seteq second {}) then {} else (union second {}))
                     else (cons (head first) (union (tail first) second))
;;

let return1:set = (sort (union arg0 arg1));;
let return2:set = (sort (union arg0 arg2));;

let restrict (ins:set num:int):set = 
    if (== num 0) then {}
    else (if (seteq ins {}) then {}
          else (cons (head ins) (restrict (tail ins) (- num 1))))
;;
(restrict return1 maxoutput);;
(restrict return2 maxoutput);;