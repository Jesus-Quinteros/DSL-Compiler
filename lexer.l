%{
#include "parser.tab.h"
#include <string.h>
#include <ctype.h>

extern YYSTYPE yylval;
%}

%%

"{"              { return LLAVE_A; }
"\"text\""       { return TEXT; }
":"              { return DP; }
"\""             { return COMILLA; }
"}"              { return LLAVE_C; }

"quiero"        { return QUIERO; }
"dibujar"       { return DIBUJAR; }
"finalizar"      { return FIN; }

"ve"             { yylval.c = 'B'; return CARACTER; }
"se"             { yylval.c = 'C'; return CARACTER; }
"de"             { yylval.c = 'D'; return CARACTER; }
"efe"            { yylval.c = 'F'; return CARACTER; }
"ge"             { yylval.c = 'G'; return CARACTER; }
"hache"          { yylval.c = 'H'; return CARACTER; }
"jota"           { yylval.c = 'J'; return CARACTER; }
"ca"             { yylval.c = 'K'; return CARACTER; }
"ele"            { yylval.c = 'L'; return CARACTER; }
"eme"            { yylval.c = 'M'; return CARACTER; }
"ene"            { yylval.c = 'N'; return CARACTER; }
"o"              { yylval.c = 'O'; return CARACTER; }
"pe"             { yylval.c = 'P'; return CARACTER; }
"q"              { yylval.c = 'Q'; return CARACTER; }
"erre"           { yylval.c = 'R'; return CARACTER; }
"ese"            { yylval.c = 'S'; return CARACTER; }
"te"             { yylval.c = 'T'; return CARACTER; }
"uve"            { yylval.c = 'V'; return CARACTER; }
"dobleu"         { yylval.c = 'W'; return CARACTER; }
"equis"          { yylval.c = 'X'; return CARACTER; }
"y"              { yylval.c = 'Y'; return CARACTER; }
"seta"           { yylval.c = 'Z'; return CARACTER; }

"circulos"       { yylval.s = strdup("circulo"); return FIG; }
"cuadrados"      { yylval.s = strdup("cuadrado"); return FIG; }
"triángulos"     { yylval.s = strdup("triangulo"); return FIG; }

"círculo"       { yylval.s = strdup("circulo"); return FIG; }
"cuadrado"      { yylval.s = strdup("cuadrado"); return FIG; }
"triángulo"     { yylval.s = strdup("triangulo"); return FIG; }

"á"              { yylval.c = 'A'; return CARACTER; }
"é"              { yylval.c = 'E'; return CARACTER; }
"í"              { yylval.c = 'I'; return CARACTER; }
"ó"              { yylval.c = 'O'; return CARACTER; }
"ú"              { yylval.c = 'U'; return CARACTER; }

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

.               { }

%%

int yywrap() { return 1; }
