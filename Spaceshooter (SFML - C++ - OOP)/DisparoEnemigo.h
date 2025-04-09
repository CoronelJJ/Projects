#pragma once
#include "SFML/Graphics.hpp"
#include <SFML/Graphics/Color.hpp>
class DisparoEnemigo: public sf::Drawable
{
public:
	
	DisparoEnemigo(int tipo, sf::Vector2f posE,sf::Vector2f posN);
	void mover(float t);
	void disparar(sf::Vector2f pos);
	bool getActivo();
	void desactivar();
	sf::Vector2f normalizar(sf::Vector2f posE, sf::Vector2f posN);

	sf::Sprite getSpriteAtaque();

private:
	sf::Texture* texDisparo1;
	sf::Texture* texDisparo2;
	sf::Texture* texDisparo3;
	sf::Texture* texDisparo4;
	sf::Texture* texDisparo5;

	sf::Sprite* spriteDisparo;
	sf::Vector2f* direccion;

	bool activo,rotar;
	float angRotacion,moveT;
	int elegido;

	void draw(sf::RenderTarget& target, sf::RenderStates states)const;
	void centrarOrigen();

};

