#pragma once
#include "SFML/Graphics.hpp"
#include <SFML/Audio.hpp>
#include "TablaDePuntuaciones.h"
#include "Jugador.h"
#include "Sonidos.h"
#include "IngresarTexto.h"
class Menu : public sf::Drawable
{
public:
	Menu();
	void getMousePos(sf::Vector2i mousePos);
	void getMouseClick(sf::Vector2i mouseClick);
	bool getCerrarVentana();
	void volver();
	void recibirTeclas(sf::Event tecla);
	bool getTerminado();
	int getNaveElegida();
	const char* getNombreElegido();
	void reiniciarMenu();

private:
	

	sf::Texture* texTitulo;
	sf::Texture* texFondo;
	sf::Texture* texFondoHangar;
	sf::Texture* texCuadro;
	sf::Texture* texPlayOn;
	sf::Texture* texPlayOff;
	sf::Texture* texExitOn;
	sf::Texture* texExitOff;
	sf::Texture* texRatingOn;
	sf::Texture* texRatingOff;
	sf::Texture* texDotOn;
	sf::Texture* texDotOff;
	sf::Texture* texNaveB;
	sf::Texture* texNaveD;
	sf::Texture* texNaveT;
	sf::Texture* texPiloto;
	sf::Texture* texHangar;
	sf::Texture* texCuadro1;
	sf::Texture* texCuadro2;
	sf::Texture* texCloud1;
	sf::Texture* texCloud2;
	sf::Texture* texBackOn;
	sf::Texture* texBackOff;

	sf::Sprite* spriteTitulo;
	sf::Sprite* spriteFondo;
	sf::Sprite* spriteFondoHangar;
	sf::Sprite* spriteCuadro;
	sf::Sprite* spritePlayOn;
	sf::Sprite* spritePlayOff;
	sf::Sprite* spriteExitOn;
	sf::Sprite* spriteExitOff;
	sf::Sprite* spriteRatingOn;
	sf::Sprite* spriteRatingOff;
	sf::Sprite* spriteDotOn;
	sf::Sprite* spriteDotOff;
	sf::Sprite* spriteNaveB;
	sf::Sprite* spriteNaveD;
	sf::Sprite* spriteNaveT;
	sf::Sprite* spritePiloto;
	sf::Sprite* spriteHangar;
	sf::Sprite* spriteCuadro1;
	sf::Sprite* spriteCuadro2;
	sf::Sprite* spriteCloud1;
	sf::Sprite* spriteCloud2;
	sf::Sprite* spriteBackOn;
	sf::Sprite* spriteBackOff;

	sf::Vector2i posMouse;

	sf::Font* fuente;
	sf::Text* textoTitulo;
	sf::Text* textoIniciar;
	sf::Text* textoJugar;
	sf::Text* textoPuntuaciones;
	sf::Text* textoSalir;
	sf::Text* textoIdentificar;

	sf::Music* menuMusic;

	bool opcionElegida, terminado,cerrarVentana,nombreIngresado,sonar,mostrarTitulo;

	int naveElegida,eleccionDeMenu;

	TablaDePuntuaciones* tablaPuntajes;
	IngresarTexto* teclas;
	Sonidos sonido;
	
	void centrarOrigen(sf::Sprite* spt);

	void draw(sf::RenderTarget& target, sf::RenderStates states)const;
};

