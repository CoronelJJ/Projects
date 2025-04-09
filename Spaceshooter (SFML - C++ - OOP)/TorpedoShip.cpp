#include "TorpedoShip.h"

TorpedoShip::TorpedoShip()
{
	spriteNave->setTexture(*texNave3);
	spriteFuego->setTexture(*texFuego3);
	animar(spriteFuego);
	spriteEscudo->setTexture(*texEscudo3);
	animar(spriteEscudo);
	spriteArmas->setTexture(*texArmas3);
	animar(spriteArmas);
	spriteDestruccion->setTexture(*texDestruccion3);
	animar(spriteDestruccion);
	centrarSprites(3);

	vidaBase = 4;
	vida = vidaBase;
	_velocidad = { 7,7 };

	spriteNave->setPosition(400.f, 550.f);
	seguirNave();

	//propio

	texAtkEpecial = new sf::Texture;
	texAtkEpecial->loadFromFile("Sprites/Special/Wave.png");

	spriteAtkEpecial = new sf::Sprite;
	spriteAtkEpecial->setTexture(*texAtkEpecial);

	mostrarEspecial = false;
	cdAE = 0.f;
	cantFrames = 6;
	frameEspecial = 0;
	velocidadaEspecial = -4;

	animarEspecial();
	centrarEspecial();

}

sf::Sprite TorpedoShip::getSpriteAtkEspecial()
{
	return *spriteAtkEpecial;
}

void TorpedoShip::activarEspecial()
{
	mostrarEspecial = true;
	spriteAtkEpecial->setPosition(getPosicion());
}

void TorpedoShip::actualizarEspecial(float t)
{

	spriteAtkEpecial->move(0, velocidadaEspecial * 60 * t);

	cdAE += t;
	if (cdAE > 0.1) {
		animarEspecial();
		frameEspecial++;
		cdAE = 0;
	}
	if (frameEspecial >= cantFrames) { frameEspecial = 0; }
}

bool TorpedoShip::mostrarAtkEsp()
{
	return mostrarEspecial;
}

void TorpedoShip::reiniciarEspecial()
{
	mostrarEspecial = false;
}

void TorpedoShip::animarEspecial()
{
	float tamX = spriteAtkEpecial->getTexture()->getSize().x;
	float tamY = spriteAtkEpecial->getTexture()->getSize().y;

	sf::IntRect frame(frameEspecial * (tamX / cantFrames), 0 * (tamY), tamX / cantFrames, tamY);
	spriteAtkEpecial->setTextureRect(frame);
}

void TorpedoShip::centrarEspecial()
{
	spriteAtkEpecial->setOrigin(spriteAtkEpecial->getGlobalBounds().width / 2, spriteAtkEpecial->getGlobalBounds().height / 2);
}
