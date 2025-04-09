#include "PickUps.h"

PickUps::PickUps(sf::Vector2f posicion)
{
	random = 0;
	effect = 1;
	velocidad = 3;
	activo = true;
	texHP = new sf::Texture;
	texHP->loadFromFile("Sprites/PickUps/HP.png");

	texLife = new sf::Texture;
	texLife->loadFromFile("Sprites/PickUps/Life.png");

	texArmor = new sf::Texture;
	texArmor->loadFromFile("Sprites/PickUps/Armor.png");

	texDamage = new sf::Texture;
	texDamage->loadFromFile("Sprites/PickUps/Damage.png");

	spritePickUp = new sf::Sprite;
	spritePickUp->setTexture(*texHP);

	srand((unsigned)time(NULL));
	random = (rand() % 10);

	if (random < 3) {
		spritePickUp->setTexture(*texHP);
		centrarOrigen();
		effect = 1;
	}
	if (random == 3) {
		spritePickUp->setTexture(*texLife);
		centrarOrigen();
		//spritePickUp->setScale(0.3, 0.3);
		effect = 2;

	}
	if (random >= 4 && random<7) {
		spritePickUp->setTexture(*texArmor);
		centrarOrigen();
		//spritePickUp->setScale(1, 0.5);
		effect = 3;
	}
	if (random >= 7) {
		spritePickUp->setTexture(*texDamage);
		centrarOrigen();
		effect = 4;
	}
	spritePickUp->setPosition(posicion);
		

	/*spriteHP = new sf::Sprite;
	spriteHP->setTexture(*texHP);

	spriteLife = new sf::Sprite;
	spriteLife->setTexture(*texLife);

	spriteArmor = new sf::Sprite;
	spriteArmor->setTexture(*texArmor);

	spriteDamage = new sf::Sprite;
	spriteDamage->setTexture(*texDamage);
	*/

	
}

int PickUps::getEfecto()
{
	return effect;
}

sf::Sprite PickUps::getSpritePickUp()
{
	return *spritePickUp;
}

void PickUps::actualizarPU(float t)
{
	spritePickUp->move(0, velocidad * t * 60);
}

void PickUps::borrar()
{
	activo = false;
}

bool PickUps::estaActivo()
{
	return activo;
}

void PickUps::centrarOrigen()
{
	float tamX = spritePickUp->getTexture()->getSize().x;
	float tamY = spritePickUp->getTexture()->getSize().y;
	spritePickUp->setOrigin(tamX / 2, tamY / 2);
}
