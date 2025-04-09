#pragma once
#include <SFML/Graphics.hpp>
#include <iostream>

class IngresarTexto: public sf::Drawable
{
public:

	IngresarTexto(float PosX, float PosY);
	const char* getNombre();
	sf::Text obtenerTexto();
	void setNombre(sf::Event evento);
	bool getValido();
	void reiniciarNombre();
	



private:
	sf::Font* fuente;
	sf::Text* texto;
	sf::Event* evento2;
	char* nombre;
	int contador,posicion;
	bool valido,enter;


	void draw(sf::RenderTarget& target, sf::RenderStates states) const;


};

