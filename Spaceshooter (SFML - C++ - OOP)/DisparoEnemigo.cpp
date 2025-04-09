#include "DisparoEnemigo.h"


DisparoEnemigo::DisparoEnemigo(int tipo, sf::Vector2f posE, sf::Vector2f posN)
{
	activo = true;
	rotar = false;
	angRotacion = 0;
	moveT = 0.f;
	elegido = tipo;

	texDisparo1 = new sf::Texture;
	texDisparo1->loadFromFile("Sprites/Enemy/attack1.png");

	texDisparo2 = new sf::Texture;
	texDisparo2->loadFromFile("Sprites/Enemy/attack2.png");

	texDisparo3 = new sf::Texture;
	texDisparo3->loadFromFile("Sprites/Enemy/attack3.png");

	texDisparo4 = new sf::Texture;
	texDisparo4->loadFromFile("Sprites/Enemy/attack4.png");

	texDisparo5 = new sf::Texture;
	texDisparo5->loadFromFile("Sprites/Enemy/attack5.png");

	spriteDisparo = new sf::Sprite;
	direccion = new sf::Vector2f;


	switch (tipo)
	{
	case 1:
		spriteDisparo->setTexture(*texDisparo1);
		spriteDisparo->setScale(0.5, 0.5);
		centrarOrigen();
		direccion->x = normalizar(posE, posN).x*5;
		direccion->y = normalizar(posE, posN).y*5;
		break;
	case 2:
		spriteDisparo->setTexture(*texDisparo2);
		spriteDisparo->setScale(0.5, 0.5);
		rotar = true;
		angRotacion = 5;
		direccion->x = 0;
		direccion->y = 5;
		break;
	case 3:
		spriteDisparo->setTexture(*texDisparo3);
		centrarOrigen();
		direccion->x = 0;
		direccion->y = 7;
		break;
	case 4:
		spriteDisparo->setTexture(*texDisparo4);
		spriteDisparo->setScale(0.5, 0.5);
		rotar = true;
		angRotacion = 10;
		centrarOrigen();
		direccion->x = 4;
		direccion->y = 5;

		break;
	case 5:
		spriteDisparo->setTexture(*texDisparo5);
		spriteDisparo->setScale(0.5, 0.5);
		rotar = true;
		angRotacion = 10.f;
		centrarOrigen();
		direccion->x = normalizar(posE, posN).x*4;
		direccion->y = normalizar(posE, posN).y*4;
		break;

	default:
		break;
	}
	

	
	spriteDisparo->setPosition(posE);
	
}

void DisparoEnemigo::mover(float t)
{
	if (rotar) {
		spriteDisparo->rotate(angRotacion);
	}
	if (elegido == 4) {
		moveT += t;
		if (moveT > 0.1f) {
			direccion->x = direccion->x * -1;
			moveT = 0;
		}

	}
	
	spriteDisparo->move(direccion->x * t * 60, direccion->y * t * 60);
	
}


void DisparoEnemigo::disparar(sf::Vector2f pos)
{
	spriteDisparo->setPosition(pos);
	
}

bool DisparoEnemigo::getActivo()
{
	return activo;
}

void DisparoEnemigo::desactivar()
{
	activo = false;
}

sf::Vector2f DisparoEnemigo::normalizar(sf::Vector2f posE, sf::Vector2f posN)
{
	float dirX = posN.x - posE.x;
	float dirY = posN.y - posE.y;
	sf::Vector2f vNormalizado;
	

	dirX = dirX / abs(dirX);
	dirY = dirY / abs(dirY);

	vNormalizado.x = dirX;
	vNormalizado.y = dirY;

	return vNormalizado;

}

sf::Sprite DisparoEnemigo::getSpriteAtaque()
{
	return *spriteDisparo;
}

void DisparoEnemigo::draw(sf::RenderTarget& target, sf::RenderStates states) const
{
	target.draw(*spriteDisparo, states);
}

void DisparoEnemigo::centrarOrigen()
{
	spriteDisparo->setOrigin(spriteDisparo->getLocalBounds().width / 2, spriteDisparo->getLocalBounds().height / 2);
	
}
