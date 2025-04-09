#pragma once
#include "SFML/Graphics.hpp"
class Planeta : public sf::Drawable
{
public:
	Planeta(float posX, float posY);
	void rotarPlaneta(float t);

private:
	sf::Texture* texPlaneta;
	sf::Sprite* spritePlaneta;

	float tamX, tamY,rotar;
	int cantFrames,frameActual;
	void acomodarSprite();

	void draw(sf::RenderTarget& target, sf::RenderStates states)const;
};

