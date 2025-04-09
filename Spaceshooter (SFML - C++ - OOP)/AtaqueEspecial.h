#pragma once
#include "SFML/Graphics.hpp"
#include <list>

class AtaqueEspecial: public sf::Drawable
{
public:
	AtaqueEspecial(int tipo);
	void actualizarEspecial(float t);
	bool getActivo();
	void activarEspecial(sf::Vector2f pos);
	int getTamanioLaser();
	sf::Sprite getSpriteEspecial();
	bool getDetonado();
	void detonar();



private:
	sf::Texture* texBomb;
	sf::Texture* texExplosion;
	sf::Texture* texWave;
	sf::Texture* texLaser;

	sf::Sprite* spriteBomb;
	sf::Sprite* spriteExplosion;
	sf::Sprite* spriteWave;
	sf::Sprite* spriteLaser;
	sf::Sprite* spriteAtaqueEspecial;

	int eleccion, frameEspecial, cantFrames, velocidad, expFrame,laserSize;
	float cdAE;
	bool detonado,activo;
	sf::Vector2f lastPos;

	void cargarTexturasDeBomba();
	void cargarTexturasDeLaser();
	void cargarTexturasDeOnda();
	void animar();

	void draw(sf::RenderTarget& target, sf::RenderStates states) const;

	

};

