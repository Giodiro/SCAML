# 
# Rules for compiling and linking the typechecker/evaluator
#
# Type
#   make         to rebuild the executable file c
#   make clean   to remove all intermediate and temporary files
#   make depend  to rebuild the intermodule dependency graph that is used
#                  by make to determine which order to schedule 
#	           compilations.  You should not need to do this unless
#                  you add new modules or new dependencies between 
#                  existing modules.  (The graph is stored in the file
#                  .depend)

# These are the object files needed to rebuild the main executable file
#
OBJS = ast.cmo scamllexer.cmo scamlparser.cmo inputlexer.cmo inputparser.cmo library.cmo interpreter.cmo main.cmo 

#COMMONOBJS = ast.cmo

# Files that need to be generated from other files
DEPEND += scamllexer.ml scamlparser.ml inputlexer.ml inputparser.ml

# When "make" is invoked with no arguments, we build an executable 
# typechecker, after building everything that it depends on
all: $(DEPEND) $(OBJS) main

# Include an automatically generated list of dependencies between source files
include .depend

# Build an executable typechecker
main: $(OBJS) main.cmo 
	@echo Linking $@
	ocamlc -o $@ $(COMMONOBJS) $(OBJS) 

# Compile an ML module interface
%.cmi : %.mli
	ocamlc -c $<
	
ast.cmo : 
	ocamlc -c ast.ml

scamlparser.cmo : scamlparser.mli scamlparser.ml ast.cmo
	ocamlc -c scamlparser.mli scamlparser.ml

inputparser.cmo : inputparser.mli inputparser.ml ast.cmo
	ocamlc -c inputparser.mli inputparser.ml

%lexer.cmo : %lexer.ml %parser.cmo
	ocamlc -c $<

# Compile an ML module implementation
%.cmo : %.ml
	ocamlc -c $<

# Generate ML files from a parser definition file
scamlparser.ml scamlparser.mli: scamlparser.mly
	@rm -f scamlparser.ml scamlparser.mli
	ocamlyacc -v scamlparser.mly
	@chmod -w scamlparser.ml scamlparser.mli

inputparser.ml inputparser.mli: inputparser.mly
	@rm -f inputparser.ml inputparser.mli
	ocamlyacc -v inputparser.mly
	@chmod -w inputparser.ml inputparser.mli

# Generate ML files from a lexer definition file
%.ml %.mli: %.mll
	@rm -f $@
	ocamllex $<
	@chmod -w $@

# Clean up the directory
clean::
	rm -rf scamllexer.ml scamlparser.ml scamlparser.mli inputlexer.ml \
	inputparser.ml inputparser.mli *.o *.cmo *.cmi parser.output \
	   c TAGS *~ 

# Rebuild intermodule dependencies
depend:: $(DEPEND) 
	ocamldep $(INCLUDE) *.mli *.ml > .depend

# 
test::
	bash test.sh
