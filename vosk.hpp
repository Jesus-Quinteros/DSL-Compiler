#ifndef VOSK_HPP
#define VOSK_HPP

#include <vosk_api.h>
#include <stdio.h>
#include <stdlib.h>
#include <string>

bool reconocer_audio(const char* modelo_path, const char* wav_path, const char* salida_path);

#endif