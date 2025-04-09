#include "Jugador.h"

Jugador::Jugador()
{
	setNombre("Billy");
	puntajeJugador = 0;
}

const char* Jugador::getNombre()
{
	return nombreJugador;
}

void Jugador::setNombre(const char* nombre)
{
	strcpy(nombreJugador, nombre);
}

int Jugador::getPuntaje()
{
	return puntajeJugador;
}

void Jugador::setPuntaje(int puntos)
{
	puntajeJugador = puntos;
}

bool Jugador::operator>(Jugador& otro)
{
	if (puntajeJugador > otro.getPuntaje()) return true;
	return false;
}

bool Jugador::operator<(Jugador& otro)
{
	if (puntajeJugador < otro.getPuntaje()) return true;
	return false;
}
