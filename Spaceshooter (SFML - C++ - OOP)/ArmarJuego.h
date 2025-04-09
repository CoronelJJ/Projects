#pragma once
#include "SFML/Graphics.hpp"
#include "Juego.h"
#include "IngresarTexto.h"
#include "TablaDePuntuaciones.h"
#include "Jugador.h"
#include "Menu.h"
class ArmarJuego
{
public:
	ArmarJuego();
	void jugando();

private:
	Jugador* Piloto;
	Juego* UTN;

	sf::RenderWindow* ventanaDeJuego;
	IngresarTexto* teclas;
	Menu menuJuego;
	TablaDePuntuaciones tabla;

	sf::Vector2i mousePos;

	bool teclaEsc, Lmouse;

	

};

