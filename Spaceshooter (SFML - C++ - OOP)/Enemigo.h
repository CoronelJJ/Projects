#pragma once
#include "SFML/Graphics.hpp"
#include<iostream>
#include<cstdlib>
class Enemigo : public sf::Drawable
{
public:
	Enemigo(float multiplicador);

	void mover(float t, float posNx);
	void recibirDanio(int danio);
	bool enemigoVivo();
	sf::Vector2f getPosicion();
	bool getCargado();
	void recargar(float t);
	int getTipo();
	sf::FloatRect getHitBox();
	int getPuntos();

private:

	sf::Texture* texEnemigo1;
	sf::Texture* texEnemigo2;
	sf::Texture* texEnemigo3;
	sf::Texture* texEnemigo4;
	sf::Texture* texEnemigo5;

	sf::Sprite* spriteEnemigo;

	int random, elegido,random2,puntos;
	bool vulnerable, listo, activo, vivo, cargado;
	float vida, moveT, direccionX, direccionY,rechargeT,rechargeCD, minimumRecharge,posInicial;

	void draw(sf::RenderTarget& target, sf::RenderStates states)const;
	void centrarOrigen();
	void patronUno(float tiempo);
	void patronDos(float tiempo,float posX);
	void patronTres(float tiempo);

};

