all: vosk

vosk: vosk.o
	g++ vosk.o -o vosk -lvosk -lportaudio

vosk.o: vosk.cpp
	g++ -c vosk.cpp

clean:
	rm -f vosk *.o
