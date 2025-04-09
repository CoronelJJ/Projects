#pragma once
#include <cstring>
class Jugador
{
public:
	Jugador();
	const char* getNombre();
	void setNombre(const char* nombre);
	int getPuntaje();
	void setPuntaje(int puntos);

	bool operator>(Jugador& otro);
	bool operator<(Jugador& otro);


private:
	char nombreJugador[9];
	int puntajeJugador;

};

