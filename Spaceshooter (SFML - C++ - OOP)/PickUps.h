#pragma once
#include "SFML/Graphics.hpp"
#include<iostream>
#include<cstdlib>
class PickUps
{
public:
	PickUps(sf::Vector2f posicion);
	int getEfecto();
	sf::Sprite getSpritePickUp();
	void actualizarPU(float t);
	void borrar();
	bool estaActivo();

private:
	sf::Texture* texHP;
	sf::Texture* texLife;
	sf::Texture* texArmor;
	sf::Texture* texDamage;

	sf::Sprite* spritePickUp;
	
	int effect;
	int random;
	int velocidad;
	bool activo;

	void centrarOrigen();
};

