#pragma once
#include "SFML/Graphics.hpp"
#include<iostream>
#include<cstdlib>

class JefeFinal : public sf::Drawable
{
public:
	JefeFinal();
	sf::Vector2f getPosArmaDer();
	sf::Vector2f getPosArmaIzq();
	sf::Vector2f getPosCabeza();
	void recargar(float t);
	bool getCargado();
	bool getListo();
	void cambiarAtaque(float t);
	int getTipoBrazos();
	int getTipoCabeza();
	void moverJefe(float t);
	void recibirDanio(int danio);
	sf::Sprite getSpriteCabeza();
	sf::Sprite getSpriteCuerpo();
	int getFase();
	void entrarEnPantalla(float t);
	bool getVivo();


private:
	sf::Texture* texHead;
	sf::Texture* texMouth;
	sf::Texture* texBody;
	sf::Texture* texLArm;
	sf::Texture* texRArm;

	sf::Sprite* spriteHead;
	sf::Sprite* spriteMouth;
	sf::Sprite* spriteBody;
	sf::Sprite* spriteLArm;
	sf::Sprite* spriteRArm;

	int vida,tipoBrazos,tipoCabeza,velocidad,direccionX,direccionY,fase;
	bool vulnerable,cargado,listo,vivo;
	float tDeRecarga,tDePatronBrazo,tDePatronCabeza;

	void centrarSprites();
	void draw(sf::RenderTarget& target, sf::RenderStates states)const;

};

