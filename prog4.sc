let asterate (max:int appendTo:string):set =
    let help (max:int as:string):set =
        if (== max 0) then {}
        else (cons (strapp appendTo as) (help (- max 1) (strapp as "a")))
    in (help max ":")
;;

let first:string = (head (sort arg0));;

(asterate maxoutput first);;