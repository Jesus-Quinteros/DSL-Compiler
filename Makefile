all: bison flex drawings.o parser.tab.o lex.yy.o main.o main

bison: parser.y
	bison -d parser.y

flex: parser.tab.h
	flex lexer.l

drawings.o: drawings.cpp drawings.hpp
	g++ -c drawings.cpp

parser.tab.o: parser.tab.c
	g++ -c parser.tab.c

lex.yy.o: lex.yy.c
	g++ -Wno-register -c lex.yy.c

main.o: main.cpp drawings.hpp parser.tab.h
	g++ -c main.cpp

main: drawings.o main.o parser.tab.o lex.yy.o
	g++ -o main drawings.o main.o parser.tab.o lex.yy.o -lsfml-graphics -lsfml-window -lsfml-system -lvosk

clean:
	rm -f parser.tab.* lex.yy.* *.o main
