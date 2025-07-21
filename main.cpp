#include <cstdio>
#include <iostream>
#include <cstdlib>
#include <filesystem>
#include "drawings.hpp"

extern FILE* yyin;
extern int yyparse();

int main() {
  std::cout << "Programa iniciado\n";

  std::cout << "Ejecutando reconocimiento de voz (vosk.exe)...\n";
  int resultado = system("vosk-worker\\vosk.exe");
  if (resultado != 0) {
    std::cerr << "Error al ejecutar vosk.exe\n";
    return 1;
  }

  const char* archivoDeEntrada = "vosk-worker/instrucciones.txt";

  std::cout << "Abriendo archivo de instrucciones: " << archivoDeEntrada << std::endl;
  yyin = fopen(archivoDeEntrada, "r");
  if (!yyin) {
    std::cerr << "No se pudo abrir el archivo: " << archivoDeEntrada << std::endl;
    return 1;
  }

  std::cout << "Parseando...\n";
  yyparse();
  fclose(yyin);
  std::cout << "Parseo terminado\n";

  mostrarVentana();

  return 0;
}
