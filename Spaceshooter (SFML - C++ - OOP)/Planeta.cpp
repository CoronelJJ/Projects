#include "Planeta.h"

Planeta::Planeta(float posX, float posY)
{
	texPlaneta = new sf::Texture;
	texPlaneta->loadFromFile("Sprites/Earth.png");

	spritePlaneta = new sf::Sprite;
	spritePlaneta->setTexture(*texPlaneta);

	spritePlaneta->setPosition(posX, posY);

	rotar = 1.f;
	frameActual = 0;

	acomodarSprite();

}

void Planeta::rotarPlaneta(float t)
{
	rotar += t;
	if (rotar > 0.15f) {
		rotar = 0.f;
		frameActual++;
	}
	if (frameActual >= cantFrames) {
		frameActual = 0;
	}
	spritePlaneta->setTextureRect(sf::IntRect(frameActual * tamX, 0 * tamY, tamX, tamY));

}


void Planeta::acomodarSprite()
{
	tamY = spritePlaneta->getTexture()->getSize().y;
	cantFrames = spritePlaneta->getTexture()->getSize().x/tamY;
	tamX = spritePlaneta->getTexture()->getSize().x / cantFrames;

	
	spritePlaneta->setTextureRect(sf::IntRect(frameActual * tamX, 0 * tamY, tamX, tamY));
	spritePlaneta->setScale(2.f, 2.f);
	spritePlaneta->setOrigin(spritePlaneta->getLocalBounds().width / 2, spritePlaneta->getLocalBounds().height / 2);

}

void Planeta::draw(sf::RenderTarget& target, sf::RenderStates states) const
{
	target.draw(*spritePlaneta, states);
}
