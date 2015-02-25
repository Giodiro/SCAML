#!/bin/bash

ocamllex scamllexer.mll
ocamlyacc scamlparser.mly
ocamlc -c scamlparser.mli
ocamlc -c scamlparser.ml
ocamlc -c scamllexer.ml
ocamlc -c main.ml

ocamlc -o main scamllexer.cmo scamlparser.cmo main.cmo
