#include "DreadNought.h"

DreadNought::DreadNought()
{
	spriteNave->setTexture(*texNave2);
	spriteFuego->setTexture(*texFuego2);
	animar(spriteFuego);
	spriteEscudo->setTexture(*texEscudo2);
	spriteArmas->setTexture(*texArmas2);
	animar(spriteArmas);
	spriteDestruccion->setTexture(*texDestruccion2);
	animar(spriteDestruccion);

	vidaBase = 7;
	vida = vidaBase;
	_velocidad = { 4,4 };

	spriteNave->setPosition(700.f, 550.f);
	seguirNave();

	///propio

	texAtkEpecial = new sf::Texture;
	texAtkEpecial->loadFromFile("Sprites/Special/Ray.png");

	spriteAtkEpecial = new sf::Sprite;
	spriteAtkEpecial->setTexture(*texAtkEpecial);

	mostrarEspecial = false;
	cdAE = 0.f;
	cantFrames = 4;
	frameEspecial = 0;
	

	animarEspecial();
	centrarEspecial();


}

sf::Sprite DreadNought::getSpriteAtkEspecial()
{
	return *spriteAtkEpecial;
}

void DreadNought::activarEspecial()
{
	mostrarEspecial = true;
	spriteAtkEpecial->setPosition(getPosicion());
}

void DreadNought::actualizarEspecial(float t)
{

	cdAE += t;
	if (cdAE > 0.1) {
		animarEspecial();
		frameEspecial++;
	}
	if (frameEspecial >= cantFrames) { frameEspecial = 0; }
}

bool DreadNought::mostrarAtkEsp()
{
	return mostrarEspecial;
}

void DreadNought::reiniciarEspecial()
{
	mostrarEspecial = false;
}

void DreadNought::animarEspecial()
{
	float tamX = spriteAtkEpecial->getTexture()->getSize().x;
	float tamY = spriteAtkEpecial->getTexture()->getSize().y;

	sf::IntRect frame(frameEspecial * (tamX / cantFrames), 0 * (tamY), tamX / cantFrames, tamY);
	spriteAtkEpecial->setTextureRect(frame);
}

void DreadNought::centrarEspecial()
{
	

	spriteAtkEpecial->setOrigin(spriteAtkEpecial->getGlobalBounds().width / 2, spriteAtkEpecial->getGlobalBounds().height / 2);


}

float DreadNought::ySize()
{
	return spriteAtkEpecial->getGlobalBounds().height;
}

void DreadNought::setPosicionEspecial(int pos)
{
	spriteAtkEpecial->setPosition(getPosicion().x, getPosicion().y - ySize() * pos);
}
