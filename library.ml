open Ast

(* myCons: word -> word list -> word list *)
let myCons str aSet = if List.mem str aSet then aSet else str::aSet;;

(* myHead: list word -> word *)
let myHead aSet = match aSet with
  | [] -> raise HeadOfEmptySet
  | h::t -> h
;;

(* myTail: word list -> word list *)
let myTail aSet = match aSet with
  | [] -> raise TailOfEmptySet
  | h::t -> t
;;

(* myEq: int -> int -> myBool *)
let myEq i1 i2 = if i1 = i2 then T else F;;

(* myPlus: int -> int -> int *)
let myPlus i1 i2 = i1+i2;;

(* myMinus: int -> int -> aexpr (Int) *)
let myMinus i1 i2 = i1-i2;;

(* myStrapp: word -> word -> word *)
let myStrapp w1 w2 = match w1,w2 with
  | Empty_Word, Empty_Word -> Empty_Word
  | (Non_Empty_Word x1), Empty_Word -> w1
  | Empty_Word, (Non_Empty_Word x2) -> w2
  | (Non_Empty_Word x1), (Non_Empty_Word x2) -> Non_Empty_Word (x1 ^ x2)
;;

(* 
  see http://caml.inria.fr/pub/docs/manual-caml-light/node14.17.html for compare_strings.
  Returns 0 if s1 and s2 are equal (or one is prefix of the other),
  -1 if str1 is lexicographically before str2,
  1 if str2 is lexicographically before str1
  myStrcomp: string -> string -> int
*)
let myStrcomp str1 str2 =
  match compare str1 str2 with
   | 0 | 2 | -2 -> 0
   | _   as x   -> x
;;

(* myWordcomp: word -> word -> int *)
let myWordcomp w1 w2 = match w1, w2 with
  | Empty_Word, Empty_Word -> 0
  | Empty_Word, _ -> -1
  | _, Empty_Word -> 1
  | (Non_Empty_Word new1), (Non_Empty_Word new2) -> myStrcomp new1 new2 
;;

(* mySetEq: word list -> word list -> myBool *)
let mySetEq s1 s2 = 
  let rec mySetEqHelper s1 s2 = match s1, s2 with
    | [], [] -> T 
    | [], _ -> F
    | _, [] -> F
    | (h1::t1), (h2::t2) -> if (myWordcomp h1 h2) = 0  
                            then mySetEqHelper t1 t2
                            else F 
  in mySetEqHelper (List.sort myWordcomp s1)
                   (List.sort myWordcomp s2)

(* Sorts a set of words in lexicographical order *)
(* mySort: word list -> word list *)                   
let mySort s = List.sort myWordcomp s

(* Returns a set containing no duplicates *)
(* myUniq: word list -> word list *)
let myUniq s = 
  let rec help acc s = match s with
    | [] -> acc
    | h::t -> help (myCons h acc) t
  in help [] s
  
(* print_aexpr: aexpr -> unit *)
let print_aexpr ae = match ae with
  | (Set (wl, _)) -> (
    let rec print_set s = match s with
      | [] -> print_string "}"
      | h::t -> ((match h, t with
                | Non_Empty_Word(w), [] -> print_string w; print_string " "
                | Non_Empty_Word(w), _ -> print_string w; print_string ", "
                | Empty_Word, []       -> print_string ":"; print_string " "
                | Empty_Word, _       -> print_string ":"; print_string ", ");
                print_set t)
    in (print_string "{ "; print_set wl; print_string "\n"; flush_all ()))
  | (Int (i, _)) -> print_endline (string_of_int i)
  | (Word (w, _)) -> ((match w with
                | Non_Empty_Word(wo) -> print_string wo; print_string ", "
                | Empty_Word        -> print_string ":"; print_string ", ");
                flush_all ())
  | (Bool (b, _)) -> (match b with
                | T -> print_endline "True "
                | F -> print_endline "False ")
  (*| (String s) -> print_endline s*)
  | _ -> raise NotApplicable
;;