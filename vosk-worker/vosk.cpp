
#include <vosk_api.h>
#include <stdio.h>
#include <stdlib.h>
#include <string>

bool reconocer_audio(const char* modelo_path, const char* wav_path, const char* salida_path) {
  FILE *wavin = fopen(wav_path, "rb");
  if (!wavin) {
    fprintf(stderr, "No se pudo abrir el archivo de audio: %s\n", wav_path);
    return false;
  }

  // Saltamos cabecera WAV
  fseek(wavin, 44, SEEK_SET);

  // Cargar el modelo
  VoskModel *model = vosk_model_new(modelo_path);
  if (!model) {
    fprintf(stderr, "No se pudo cargar el modelo Vosk.\n");
    fclose(wavin);
    return false;
  }

  VoskRecognizer *recognizer = vosk_recognizer_new(model, 16000.0);
  if (!recognizer) {
    fprintf(stderr, "No se pudo crear el reconocedor.\n");
    vosk_model_free(model);
    fclose(wavin);
    return false;
  }

  char buffer[3200];
  int nread;
  while ((nread = fread(buffer, 1, sizeof(buffer), wavin)) > 0) {
    vosk_recognizer_accept_waveform(recognizer, buffer, nread);
  }

  const char* resultado = vosk_recognizer_final_result(recognizer);

  // Guardar en archivo
  FILE *output = fopen(salida_path, "w");
  if (!output) {
    fprintf(stderr, "No se pudo crear el archivo de salida: %s\n", salida_path);
    vosk_recognizer_free(recognizer);
    vosk_model_free(model);
    fclose(wavin);
    return false;
  }

  fprintf(output, "%s\n", resultado);
  fclose(output);

  // Liberar recursos
  vosk_recognizer_free(recognizer);
  vosk_model_free(model);
  fclose(wavin);

  return true;
}

int main() {
  if (reconocer_audio("vosk-worker/model/vosk-model-small-es-0.42", "vosk-worker/test.wav", "vosk-worker/instrucciones.txt")) {
    printf("Reconocimiento completado y guardado en instrucciones.txt\n");
  } else {
    printf("Hubo un error durante el reconocimiento.\n");
  }
  return 0;
}
