#pragma once
#include "SFML/Graphics.hpp"


using namespace sf;

class Disparo
{
private:
	Texture* _texDisparo1;
	Texture* _texDisparo2;
	Texture* _texDisparo3;
	Sprite* _sptDisparo;
	Vector2f velocidad;
	int eleccion,frameActual,cantFrames,danio;
	bool rotar,_activo;
	
	void animarDisparo(Sprite* proyectil);
	Sprite centrarOrigen(Sprite *proyectil);

public:

	Disparo(int tipo,Vector2f posicion,int multiplicador);
	Sprite getSprite();
	void actualizar(float t);
	void setPosicionDisparo(float enX, float enY);
	void torpedo(int frame, float time);
	FloatRect devolverPosicion();
	bool estaActivo();
	void destruir();

	int getDanio();

};

