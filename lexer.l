%{
#include "parser.tab.h"
#include <string.h>
#include <ctype.h>
#include <stdlib.h>
#include <stdio.h>

int yycolumn = 1;

// Esta macro se ejecuta antes de cada regla
#define YY_USER_ACTION yycolumn += yyleng;

extern YYSTYPE yylval;
%}

%option yylineno

%%

\n      { yylineno++; yycolumn = 1; }

"{"              { return llave_apertura; }
"\"text\""       { return text; }
":"              { return dp; }
"\""             { return comilla; }
"}"              { return llave_cierre; }

"inicio" { return inicio; }
"finalizar"      { return fin; }

([ \t\n\r\"]|^)ve([ \t\n\r\"]|$)         { yylval.c = 'B'; return CARACTER; }
([ \t\n\r\"]|^)se([ \t\n\r\"]|$)         { yylval.c = 'C'; return CARACTER; }
([ \t\n\r\"]|^)de([ \t\n\r\"]|$)         { yylval.c = 'D'; return CARACTER; }
([ \t\n\r\"]|^)efe([ \t\n\r\"]|$)        { yylval.c = 'F'; return CARACTER; }
([ \t\n\r\"]|^)ge([ \t\n\r\"]|$)         { yylval.c = 'G'; return CARACTER; }
([ \t\n\r\"]|^)che([ \t\n\r\"]|$)        { yylval.c = 'H'; return CARACTER; }
([ \t\n\r\"]|^)jota([ \t\n\r\"]|$)       { yylval.c = 'J'; return CARACTER; }
([ \t\n\r\"]|^)ca([ \t\n\r\"]|$)         { yylval.c = 'K'; return CARACTER; }
([ \t\n\r\"]|^)ele([ \t\n\r\"]|$)        { yylval.c = 'L'; return CARACTER; }
([ \t\n\r\"]|^)m([ \t\n\r\"]|$)        { yylval.c = 'M'; return CARACTER; }
([ \t\n\r\"]|^)ene([ \t\n\r\"]|$)        { yylval.c = 'N'; return CARACTER; }
([ \t\n\r\"]|^)pe([ \t\n\r\"]|$)         { yylval.c = 'P'; return CARACTER; }
([ \t\n\r\"]|^)q([ \t\n\r\"]|$)          { yylval.c = 'Q'; return CARACTER; }
([ \t\n\r\"]|^)erre([ \t\n\r\"]|$)       { yylval.c = 'R'; return CARACTER; }
([ \t\n\r\"]|^)ese([ \t\n\r\"]|$)        { yylval.c = 'S'; return CARACTER; }
([ \t\n\r\"]|^)te([ \t\n\r\"]|$)         { yylval.c = 'T'; return CARACTER; }
([ \t\n\r\"]|^)uve([ \t\n\r\"]|$)        { yylval.c = 'V'; return CARACTER; }
([ \t\n\r\"]|^)dobleu([ \t\n\r\"]|$)     { yylval.c = 'W'; return CARACTER; }
([ \t\n\r\"]|^)equis([ \t\n\r\"]|$)      { yylval.c = 'X'; return CARACTER; }
([ \t\n\r\"]|^)y([ \t\n\r\"]|$)          { yylval.c = 'Y'; return CARACTER; }
([ \t\n\r\"]|^)seta([ \t\n\r\"]|$)       { yylval.c = 'Z'; return CARACTER; }

"circulos"       { yylval.s = strdup("circulo"); return FIG; }
"cuadrados"      { yylval.s = strdup("cuadrado"); return FIG; }
"triángulos"     { yylval.s = strdup("triangulo"); return FIG; }

"círculo"       { yylval.s = strdup("circulo"); return FIG; }
"cuadrado"      { yylval.s = strdup("cuadrado"); return FIG; }
"triángulo"     { yylval.s = strdup("triangulo"); return FIG; }

([ \t\n\r\"]|^)[áa]([ \t\n\r\"]|$)       { yylval.c = 'A'; return CARACTER; }
([ \t\n\r\"]|^)[ée]([ \t\n\r\"]|$)       { yylval.c = 'E'; return CARACTER; }
([ \t\n\r\"]|^)[íi]([ \t\n\r\"]|$)       { yylval.c = 'I'; return CARACTER; }
([ \t\n\r\"]|^)[óo]([ \t\n\r\"]|$)       { yylval.c = 'O'; return CARACTER; }
([ \t\n\r\"]|^)[úu]([ \t\n\r\"]|$)       { yylval.c = 'U'; return CARACTER; }

"cero"              { yylval.c = '0'; return DIGITO; }
"uno"              { yylval.c = '1'; return DIGITO; }
"dos"              { yylval.c = '2'; return DIGITO; }
"tres"              { yylval.c = '3'; return DIGITO; }
"cuatro"              { yylval.c = '4'; return DIGITO; }
"cinco"              { yylval.c = '5'; return DIGITO; }
"seis"              { yylval.c = '6'; return DIGITO; }
"siete"              { yylval.c = '7'; return DIGITO; }
"ocho"              { yylval.c = '8'; return DIGITO; }
"nueve"              { yylval.c = '9'; return DIGITO; }

[ \t\n\r]+      { }

[a-záéíóúA-Z]+               { printf("Ignorado: %s\n", yytext); return ignorar; }

%%

int yywrap() { return 1; }
