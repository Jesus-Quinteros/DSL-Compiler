%{
#include <iostream>
#include <string.h>
#include "drawings.hpp"

extern int yylex();
extern int yyparse();
extern FILE* yyin;
void yyerror(const char* s);
%}

%union {
    char c;
    char* s;
}

%token QUIERO DIBUJAR FIGURA FIN
%token <c> CARACTER DIGITO
%token <s> FIG

%%

programa:
    QUIERO DIBUJAR elementos FIN
    ;

elementos:
    elementos elemento
    | elemento
    ;

elemento:
    CARACTER           { dibujarLetra($1); }
  | DIGITO             { dibujarNumero($1); }
  | FIG                { dibujarFigura($1); free($1); }
  ;

%%
void yyerror(const char* s) {
    std::cerr << "Error de sintaxis: " << s << std::endl;
}
