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

%token LLAVE_A LLAVE_C TEXT DP COMILLA
%token QUIERO DIBUJAR FIN
%token <c> CARACTER
%token <c> DIGITO
%token <s> FIG

%%

programa:
    bloque_unico
    | bloque_I bloque_F
    | bloque_I bloques bloque_F
    ;

bloque_unico:
    LLAVE_A TEXT DP COMILLA QUIERO DIBUJAR elementos FIN COMILLA LLAVE_C;

bloque_I:
    LLAVE_A TEXT DP COMILLA QUIERO DIBUJAR elementos COMILLA LLAVE_C;

bloque_F:
    LLAVE_A TEXT DP COMILLA elementos FIN COMILLA LLAVE_C
    | LLAVE_A TEXT DP COMILLA FIN COMILLA LLAVE_C
    ;

bloques:
    bloques bloque
    | bloque
    ;

bloque:
    LLAVE_A TEXT DP COMILLA elementos COMILLA LLAVE_C
    ;

elementos:
    elementos elemento
    | elemento
    ;

elemento:
    CARACTER                { dibujarLetra($1); }
  | DIGITO FIG              { 
                               int cantidad = $1 - '0'; 
                               for (int i = 0; i < cantidad; ++i)
                                 dibujarFigura($2); 
                               free($2); 
                            }
  | FIG                     { dibujarFigura($1); free($1); }
  | DIGITO                  { dibujarNumero($1); }
  ;

%%
void yyerror(const char* s) {
    std::cerr << "Error de sintaxis: " << s << std::endl;
}
