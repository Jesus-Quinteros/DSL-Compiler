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

([ \t\n\r\"]|^)ve([ \t\n\r\"]|$)         { printf("ELEMENTO: %s\n", yytext); yylval.c = 'B'; yyless(yyleng - 1); return CARACTER; }
([ \t\n\r\"]|^)se([ \t\n\r\"]|$)         { printf("ELEMENTO: %s\n", yytext); yylval.c = 'C'; yyless(yyleng - 1); return CARACTER; }
([ \t\n\r\"]|^)de([ \t\n\r\"]|$)         { printf("ELEMENTO: %s\n", yytext); yylval.c = 'D'; yyless(yyleng - 1); return CARACTER; }
([ \t\n\r\"]|^)efe([ \t\n\r\"]|$)        { printf("ELEMENTO: %s\n", yytext); yylval.c = 'F'; yyless(yyleng - 1); return CARACTER; }
([ \t\n\r\"]|^)ge([ \t\n\r\"]|$)         { printf("ELEMENTO: %s\n", yytext); yylval.c = 'G'; yyless(yyleng - 1); return CARACTER; }
([ \t\n\r\"]|^)che([ \t\n\r\"]|$)        { printf("ELEMENTO: %s\n", yytext); yylval.c = 'H'; yyless(yyleng - 1); return CARACTER; }
([ \t\n\r\"]|^)jota([ \t\n\r\"]|$)       { printf("ELEMENTO: %s\n", yytext); yylval.c = 'J'; yyless(yyleng - 1); return CARACTER; }
([ \t\n\r\"]|^)ca([ \t\n\r\"]|$)         { printf("ELEMENTO: %s\n", yytext); yylval.c = 'K'; yyless(yyleng - 1); return CARACTER; }
([ \t\n\r\"]|^)ele([ \t\n\r\"]|$)        { printf("ELEMENTO: %s\n", yytext); yylval.c = 'L'; yyless(yyleng - 1); return CARACTER; }
([ \t\n\r\"]|^)m([ \t\n\r\"]|$)          { printf("ELEMENTO: %s\n", yytext); yylval.c = 'M'; yyless(yyleng - 1); return CARACTER; }
([ \t\n\r\"]|^)ene([ \t\n\r\"]|$)        { printf("ELEMENTO: %s\n", yytext); yylval.c = 'N'; yyless(yyleng - 1); return CARACTER; }
([ \t\n\r\"]|^)pe([ \t\n\r\"]|$)         { printf("ELEMENTO: %s\n", yytext); yylval.c = 'P'; yyless(yyleng - 1); return CARACTER; }
([ \t\n\r\"]|^)q([ \t\n\r\"]|$)          { printf("ELEMENTO: %s\n", yytext); yylval.c = 'Q'; yyless(yyleng - 1); return CARACTER; }
([ \t\n\r\"]|^)erre([ \t\n\r\"]|$)       { printf("ELEMENTO: %s\n", yytext); yylval.c = 'R'; yyless(yyleng - 1); return CARACTER; }
([ \t\n\r\"]|^)ese([ \t\n\r\"]|$)        { printf("ELEMENTO: %s\n", yytext); yylval.c = 'S'; yyless(yyleng - 1); return CARACTER; }
([ \t\n\r\"]|^)te([ \t\n\r\"]|$)         { printf("ELEMENTO: %s\n", yytext); yylval.c = 'T'; yyless(yyleng - 1); return CARACTER; }
([ \t\n\r\"]|^)uve([ \t\n\r\"]|$)        { printf("ELEMENTO: %s\n", yytext); yylval.c = 'V'; yyless(yyleng - 1); return CARACTER; }
([ \t\n\r\"]|^)dobleu([ \t\n\r\"]|$)     { printf("ELEMENTO: %s\n", yytext); yylval.c = 'W'; yyless(yyleng - 1); return CARACTER; }
([ \t\n\r\"]|^)equis([ \t\n\r\"]|$)      { printf("ELEMENTO: %s\n", yytext); yylval.c = 'X'; yyless(yyleng - 1); return CARACTER; }
([ \t\n\r\"]|^)y([ \t\n\r\"]|$)          { printf("ELEMENTO: %s\n", yytext); yylval.c = 'Y'; yyless(yyleng - 1); return CARACTER; }
([ \t\n\r\"]|^)seta([ \t\n\r\"]|$)       { printf("ELEMENTO: %s\n", yytext); yylval.c = 'Z'; yyless(yyleng - 1); return CARACTER; }

"circulos"       { yylval.s = strdup("circulo"); return FIG; }
"cuadrados"      { yylval.s = strdup("cuadrado"); return FIG; }
"triángulos"     { yylval.s = strdup("triangulo"); return FIG; }

"círculo"       { yylval.s = strdup("circulo"); return FIG; }
"cuadrado"      { yylval.s = strdup("cuadrado"); return FIG; }
"triángulo"     { yylval.s = strdup("triangulo"); return FIG; }

([ \t\n\r\"]|^)[áa]([ \t\n\r\"]|$)       { printf("ELEMENTO: %s\n", yytext); yylval.c = 'A'; yyless(yyleng - 1); return CARACTER; }
([ \t\n\r\"]|^)[ée]([ \t\n\r\"]|$)       { printf("ELEMENTO: %s\n", yytext); yylval.c = 'E'; yyless(yyleng - 1); return CARACTER; }
([ \t\n\r\"]|^)[íi]([ \t\n\r\"]|$)       { printf("ELEMENTO: %s\n", yytext); yylval.c = 'I'; yyless(yyleng - 1); return CARACTER; }
([ \t\n\r\"]|^)[óo]([ \t\n\r\"]|$)       { printf("ELEMENTO: %s\n", yytext); yylval.c = 'O'; yyless(yyleng - 1); return CARACTER; }
([ \t\n\r\"]|^)[úu]([ \t\n\r\"]|$)       { printf("ELEMENTO: %s\n", yytext); yylval.c = 'U'; yyless(yyleng - 1); return CARACTER; }

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
