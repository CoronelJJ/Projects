#pragma once
#include "SFML/Graphics.hpp"
#include "Jugador.h"
#include <fstream>
#include <iostream>

class TablaDePuntuaciones : public sf::Drawable
{
public:
	TablaDePuntuaciones();
	void modificarLista(Jugador* jugadorActual);
	void cargarPuntuacionesEnVector();
	bool getCargados();
	void cargarArchivoParaMostrar();
	

private:
	Jugador *player;
	Jugador* vectorPuntajes;
	FILE* archivoPuntuaciones;
	sf::Texture* texFondo;
	sf::Texture* texTabla;


	sf::Sprite* spriteFondo;
	sf::Sprite* spriteTabla;

	sf::Text* textoTitulo;
	sf::Text* textoNombre;
	sf::Text* textoPuntos;

	sf::Font* fuente;

	bool cargados;


	void abrirArchivoModoLectura();
	void abrirArchivoModoSobreescribir();
	void cerrarArchivo();
	bool evaluarNuevaPuntuacionAlta(Jugador jugador);
	void hardCodeTabla();
	void ordenarVector();
	void guardarVectorEnArchivo();
	

	void draw(sf::RenderTarget& target, sf::RenderStates states) const;

};

