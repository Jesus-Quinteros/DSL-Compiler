%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "drawings.hpp"

extern int yylineno;
extern int yycolumn;
extern int yylex();
extern int yyparse();
extern FILE* yyin;
void yyerror(const char* s);
%}

%union {
    char c;
    char* s;
}

%token llave_apertura llave_cierre text dp comilla
%token inicio fin
%token <c> CARACTER
%token <c> DIGITO
%token <s> FIG
%token <vacio> ignorar

%%

programa:
    bloque_unico
    | bloque_inicial bloque_final
    | bloque_inicial bloques bloque_final
    ;

bloque_unico:
    llave_apertura text dp comilla inicio elementos fin comilla llave_cierre
    | llave_apertura text dp comilla inicio fin comilla llave_cierre
    ;

bloque_inicial:
    llave_apertura text dp comilla inicio elementos comilla llave_cierre
    | llave_apertura text dp comilla inicio comilla llave_cierre
    ;

bloque_final:
    llave_apertura text dp comilla elementos fin comilla llave_cierre
    | llave_apertura text dp comilla fin comilla llave_cierre
    ;

bloques:
    bloques bloque
    | bloque
    ;

bloque:
    llave_apertura text dp comilla elementos comilla llave_cierre
    ;

elementos:
    elementos elemento
    | elementos ignorar
    | elemento
    | ignorar
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
    fprintf(stderr, "Error de sintaxis en linea %d, columna %d: %s\n", yylineno, yycolumn, s);
    //exit(EXIT_FAILURE);
}
