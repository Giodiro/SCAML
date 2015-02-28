let asterate (max:int):set =
    let help (max:int as:string):set =
        if (== max 0) then {}
        else (cons as (help (- max 1) (strapp as "a")))
    in (help max ":")
;;

let concatenation (set1:set):set = 
    if (seteq set1 {}) then {} 
    else ()

let permutations (inset:set):set = 

getPermutations(index, output)
   if index == output.length
      solutions.add(output)
   else
      for each box b
         output[index] = b
         getPermutations(index + 1, output)