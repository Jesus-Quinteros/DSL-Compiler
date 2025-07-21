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

"{"              { printf("LLAVE_APERTURA\n"); return llave_apertura; }
"\"text\""       { printf("TEXT\n"); return text; }
":"              { printf("DP\n"); return dp; }
"\""             { printf("COMILLA\n"); return comilla; }
"}"              { printf("LLAVE_CIERRE\n"); return llave_cierre; }

"quiero dibujar" { printf("INICIO\n"); return inicio; }
"finalizar"      { printf("FIN\n"); return fin; }

ve([ \t\n\r\"]|$)         { printf("ELEMENTO: %s\n", yytext); yylval.c = 'B'; yyless(yyleng - 1); return CARACTER; }
se([ \t\n\r\"]|$)         { printf("ELEMENTO: %s\n", yytext); yylval.c = 'C'; yyless(yyleng - 1); return CARACTER; }
de([ \t\n\r\"]|$)         { printf("ELEMENTO: %s\n", yytext); yylval.c = 'D'; yyless(yyleng - 1); return CARACTER; }
efe([ \t\n\r\"]|$)        { printf("ELEMENTO: %s\n", yytext); yylval.c = 'F'; yyless(yyleng - 1); return CARACTER; }
ge([ \t\n\r\"]|$)         { printf("ELEMENTO: %s\n", yytext); yylval.c = 'G'; yyless(yyleng - 1); return CARACTER; }
che([ \t\n\r\"]|$)        { printf("ELEMENTO: %s\n", yytext); yylval.c = 'H'; yyless(yyleng - 1); return CARACTER; }
jota([ \t\n\r\"]|$)       { printf("ELEMENTO: %s\n", yytext); yylval.c = 'J'; yyless(yyleng - 1); return CARACTER; }
ca([ \t\n\r\"]|$)         { printf("ELEMENTO: %s\n", yytext); yylval.c = 'K'; yyless(yyleng - 1); return CARACTER; }
ele([ \t\n\r\"]|$)        { printf("ELEMENTO: %s\n", yytext); yylval.c = 'L'; yyless(yyleng - 1); return CARACTER; }
m([ \t\n\r\"]|$)          { printf("ELEMENTO: %s\n", yytext); yylval.c = 'M'; yyless(yyleng - 1); return CARACTER; }
ene([ \t\n\r\"]|$)        { printf("ELEMENTO: %s\n", yytext); yylval.c = 'N'; yyless(yyleng - 1); return CARACTER; }
pe([ \t\n\r\"]|$)         { printf("ELEMENTO: %s\n", yytext); yylval.c = 'P'; yyless(yyleng - 1); return CARACTER; }
q([ \t\n\r\"]|$)          { printf("ELEMENTO: %s\n", yytext); yylval.c = 'Q'; yyless(yyleng - 1); return CARACTER; }
erre([ \t\n\r\"]|$)       { printf("ELEMENTO: %s\n", yytext); yylval.c = 'R'; yyless(yyleng - 1); return CARACTER; }
ese([ \t\n\r\"]|$)        { printf("ELEMENTO: %s\n", yytext); yylval.c = 'S'; yyless(yyleng - 1); return CARACTER; }
te([ \t\n\r\"]|$)         { printf("ELEMENTO: %s\n", yytext); yylval.c = 'T'; yyless(yyleng - 1); return CARACTER; }
uve([ \t\n\r\"]|$)        { printf("ELEMENTO: %s\n", yytext); yylval.c = 'V'; yyless(yyleng - 1); return CARACTER; }
dobleu([ \t\n\r\"]|$)     { printf("ELEMENTO: %s\n", yytext); yylval.c = 'W'; yyless(yyleng - 1); return CARACTER; }
equis([ \t\n\r\"]|$)      { printf("ELEMENTO: %s\n", yytext); yylval.c = 'X'; yyless(yyleng - 1); return CARACTER; }
y([ \t\n\r\"]|$)          { printf("ELEMENTO: %s\n", yytext); yylval.c = 'Y'; yyless(yyleng - 1); return CARACTER; }
seta([ \t\n\r\"]|$)       { printf("ELEMENTO: %s\n", yytext); yylval.c = 'Z'; yyless(yyleng - 1); return CARACTER; }

círculos([ \t\n\r\"]|$)       { printf("ELEMENTO: %s\n", yytext); yylval.s = strdup("circulo"); yyless(yyleng - 1); return FIG; }
cuadrados([ \t\n\r\"]|$)      { printf("ELEMENTO: %s\n", yytext); yylval.s = strdup("cuadrado"); yyless(yyleng - 1); return FIG; }
triángulos([ \t\n\r\"]|$)     { printf("ELEMENTO: %s\n", yytext); yylval.s = strdup("triangulo"); yyless(yyleng - 1); return FIG; }

círculo([ \t\n\r\"]|$)       { printf("ELEMENTO: %s\n", yytext); yylval.s = strdup("circulo"); yyless(yyleng - 1); return FIG; }
cuadrado([ \t\n\r\"]|$)      { printf("ELEMENTO: %s\n", yytext); yylval.s = strdup("cuadrado"); yyless(yyleng - 1); return FIG; }
triángulo([ \t\n\r\"]|$)     { printf("ELEMENTO: %s\n", yytext); yylval.s = strdup("triangulo"); yyless(yyleng - 1); return FIG; }

[áa]([ \t\n\r\"]|$)       { printf("ELEMENTO: %s\n", yytext); yylval.c = 'A'; yyless(yyleng - 1); return CARACTER; }
[ée]([ \t\n\r\"]|$)       { printf("ELEMENTO: %s\n", yytext); yylval.c = 'E'; yyless(yyleng - 1); return CARACTER; }
[íi]([ \t\n\r\"]|$)       { printf("ELEMENTO: %s\n", yytext); yylval.c = 'I'; yyless(yyleng - 1); return CARACTER; }
[óo]([ \t\n\r\"]|$)       { printf("ELEMENTO: %s\n", yytext); yylval.c = 'O'; yyless(yyleng - 1); return CARACTER; }
[úu]([ \t\n\r\"]|$)       { printf("ELEMENTO: %s\n", yytext); yylval.c = 'U'; yyless(yyleng - 1); return CARACTER; }

"cero"             { printf("ELEMENTO: %s\n", yytext); yylval.c = '0'; return DIGITO; }
"uno"              { printf("ELEMENTO: %s\n", yytext); yylval.c = '1'; return DIGITO; }
"dos"              { printf("ELEMENTO: %s\n", yytext); yylval.c = '2'; return DIGITO; }
"tres"             { printf("ELEMENTO: %s\n", yytext); yylval.c = '3'; return DIGITO; }
"cuatro"           { printf("ELEMENTO: %s\n", yytext); yylval.c = '4'; return DIGITO; }
"cinco"            { printf("ELEMENTO: %s\n", yytext); yylval.c = '5'; return DIGITO; }
"seis"             { printf("ELEMENTO: %s\n", yytext); yylval.c = '6'; return DIGITO; }
"siete"            { printf("ELEMENTO: %s\n", yytext); yylval.c = '7'; return DIGITO; }
"ocho"             { printf("ELEMENTO: %s\n", yytext); yylval.c = '8'; return DIGITO; }
"nueve"            { printf("ELEMENTO: %s\n", yytext); yylval.c = '9'; return DIGITO; }

[ \t\n\r]+      { }

[a-záéíóúA-Z]+               { printf("Ignorado: %s\n", yytext); return ignorar; }

%%

int yywrap() { return 1; }
