#pragma once
#include "SFML/Graphics.hpp"
#include<iostream>
#include<cstdlib>
class Asteroide : public sf::Drawable
{
public:
	Asteroide();
	void recibirDanio(int danio);
	bool getFinalizado();
	void acomodarSprites();
	sf::Sprite getSprite();
	void actualizar(float t);
	void animarExplosion(float et);
	sf::FloatRect getHitBox();
	void destruir();

private:
	sf::Texture* texBase;
	sf::Texture* texExplosion;

	sf::Sprite* spriteBase;
	sf::Sprite* spriteExplosion;

	int frameExp, vida, cantFrames, velocidad, direccion, randomPosX, randomPosY;
	bool vivo, detonar, finalizado;
	float expTime;



	void draw(sf::RenderTarget& target, sf::RenderStates states)const;
};

