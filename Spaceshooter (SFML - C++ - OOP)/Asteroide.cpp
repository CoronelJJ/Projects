#include "Asteroide.h"

Asteroide::Asteroide()
{
	vida = 20;
	vivo = true;
	frameExp = 0;
	detonar = false;
	expTime = 0;
	finalizado = false;
	velocidad = 3;

	texBase = new sf::Texture;
	texExplosion = new sf::Texture;

	texBase->loadFromFile("Sprites/Asteroid Base.png");
	texExplosion->loadFromFile("Sprites/Asteroid Explode.png");

	spriteBase = new sf::Sprite;
	spriteExplosion = new sf::Sprite;


	spriteBase->setTexture(*texBase);
	spriteExplosion->setTexture(*texExplosion);

	acomodarSprites();

	//srand((unsigned)time(NULL));
	randomPosY = (rand() % 150) + 200;

	if (randomPosY % 2 == 0) {
		randomPosX = -50;
		direccion = 1;
	}
	else {
		randomPosX = 850;
		direccion= -1;
	}
	spriteBase->setPosition(randomPosX, randomPosY);
	//direccion = 1;

}

void Asteroide::recibirDanio(int danio)
{
	vida -= danio;
	if (vida<0)
	{
		vivo = false;
		detonar = true;
	}
}

bool Asteroide::getFinalizado()
{
	return finalizado;
}

void Asteroide::acomodarSprites()
{	
	spriteBase->setScale(1.3f, 1.3f);
	spriteBase->setOrigin(spriteBase->getLocalBounds().width / 2, spriteBase->getLocalBounds().height / 2);
	
	cantFrames = spriteExplosion->getTexture()->getSize().x / spriteExplosion->getTexture()->getSize().y;
	
	float tamX = spriteExplosion->getTexture()->getSize().x;
	float tamY = spriteExplosion->getTexture()->getSize().y;

	sf::IntRect frame(frameExp* (tamX / cantFrames), 0 * (tamY), tamX / cantFrames, tamY);

	spriteExplosion->setTextureRect(frame);
	spriteExplosion->setScale(1.3f, 1.3f);
	spriteExplosion->setOrigin(spriteExplosion->getLocalBounds().width / 2, spriteExplosion->getLocalBounds().height / 2);

}

sf::Sprite Asteroide::getSprite()
{
	return *spriteBase;
}

void Asteroide::actualizar(float t)
{
	if (vivo) {
		spriteBase->move(direccion * velocidad * t * 60, 0);
		spriteExplosion->setPosition(spriteBase->getPosition());

	}
	else {
		animarExplosion(t);
	}

}

void Asteroide::animarExplosion(float et)
{
	expTime += et;
	if (expTime>0.1f)
	{
		frameExp++;
		expTime = 0;
	}
	if (frameExp >= cantFrames) { finalizado = true; }
	float tamX = spriteExplosion->getTexture()->getSize().x;
	float tamY = spriteExplosion->getTexture()->getSize().y;

	sf::IntRect frame(frameExp * (tamX / cantFrames), 0 * (tamY), tamX / cantFrames, tamY);

	spriteExplosion->setTextureRect(frame);
}

sf::FloatRect Asteroide::getHitBox()
{
	return spriteBase->getGlobalBounds();
}

void Asteroide::destruir()
{
	finalizado = true;
}

void Asteroide::draw(sf::RenderTarget& target, sf::RenderStates states) const
{
	target.draw(*spriteExplosion, states);
}
