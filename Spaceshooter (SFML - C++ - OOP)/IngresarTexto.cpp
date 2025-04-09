#include "IngresarTexto.h"

IngresarTexto::IngresarTexto(float PosX, float PosY)
{
	fuente = new sf::Font();
	fuente->loadFromFile("Sprites/UI/neuropol x rg.otf");

	texto = new sf::Text;
	texto->setFont(*fuente);

	contador = 0;
	posicion = 0;

	evento2 = new sf::Event;

	//setString
	valido = false;
	
	enter = false;

	nombre = new char[9] {"___"};

	texto->setString(nombre);
	texto->setPosition(PosX,PosY);

}

const char* IngresarTexto::getNombre()
{
	return (const char*)nombre;
}



sf::Text IngresarTexto::obtenerTexto()
{
	
	return *texto;
}

void IngresarTexto::setNombre(sf::Event evento)
{
	
		switch (evento.type) {
		case sf::Event::TextEntered:
			if (evento.text.unicode >= 33 && evento.text.unicode <= 126 && posicion<8) {
				nombre[posicion] = (char)evento.text.unicode;
				//std::cout<< (char)evento.text.unicode;
				posicion++;
			}
			else if(evento.text.unicode == 8) {
				posicion--;
				nombre[posicion] = ' ';
				
			}
			if (evento.text.unicode == 13) {
				enter = true;
			}
			break;
		}
			

		if (posicion < 0) { posicion = 0; }

		if (posicion > 2 && posicion < 10 && enter) {
			valido = true;
		}
		else { enter = false; }
		texto->setString(nombre);
	

}

bool IngresarTexto::getValido()
{
	return valido;
}

void IngresarTexto::reiniciarNombre()
{
	valido = false;
	enter = false;
	nombre = new char[9] {"___"};
	posicion = 0;
}

void IngresarTexto::draw(sf::RenderTarget& target, sf::RenderStates states) const
{
	target.draw(*texto, states);
}
