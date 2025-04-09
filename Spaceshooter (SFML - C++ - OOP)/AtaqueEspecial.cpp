#include "AtaqueEspecial.h"

AtaqueEspecial::AtaqueEspecial(int tipo)
{
	eleccion = tipo;
	texBomb = new sf::Texture;
	texExplosion = new sf::Texture[8];

	texWave = new sf::Texture;

	texLaser = new sf::Texture;
	
	spriteAtaqueEspecial = new sf::Sprite;
	spriteExplosion = new sf::Sprite[8];

	spriteAtaqueEspecial->setPosition(400, 700);

	frameEspecial = 0;
	cdAE = 5.f;
	expFrame = 0;
	detonado = false;
	laserSize = 1;

	switch (eleccion)
	{
	case 1:
		cargarTexturasDeBomba();
		velocidad = -3;

		break;
	case 2:
		cantFrames = 4;
		cargarTexturasDeLaser();
		velocidad = 0;
		break;

	case 3:
		cantFrames = 6;
		cargarTexturasDeOnda();
		velocidad = -5;
		break;
	default:
		break;
	}



}

void AtaqueEspecial::cargarTexturasDeBomba()
{
	texBomb->loadFromFile("Sprites/Special/shot4_5.png");

	texExplosion[0].loadFromFile("Sprites/Special/shot4_exp1.png");
	texExplosion[1].loadFromFile("Sprites/Special/shot4_exp2.png");
	texExplosion[2].loadFromFile("Sprites/Special/shot4_exp3.png");
	texExplosion[3].loadFromFile("Sprites/Special/shot4_exp4.png");
	texExplosion[4].loadFromFile("Sprites/Special/shot4_exp5.png");
	texExplosion[5].loadFromFile("Sprites/Special/shot4_exp6.png");
	texExplosion[6].loadFromFile("Sprites/Special/shot4_exp7.png");
	texExplosion[7].loadFromFile("Sprites/Special/shot4_exp8.png");

	spriteAtaqueEspecial->setTexture(*texBomb);
	spriteAtaqueEspecial->setOrigin(spriteAtaqueEspecial->getGlobalBounds().width / 2, spriteAtaqueEspecial->getGlobalBounds().height / 2);
	spriteAtaqueEspecial->setScale(3.f, 3.f);
	spriteAtaqueEspecial->setRotation(-90);

	for (int i = 0;i < 8;i++) {
		spriteExplosion[i].setTexture(texExplosion[i]);
		spriteExplosion[i].setOrigin(spriteExplosion[i].getGlobalBounds().width / 2,
			spriteExplosion[i].getGlobalBounds().height / 2);

		spriteExplosion[i].setScale(8.f, 8.f);
		spriteExplosion[i].rotate(-90);
	}




}

void AtaqueEspecial::cargarTexturasDeLaser()
{
	texLaser->loadFromFile("Sprites/Special/Ray.png");

	spriteAtaqueEspecial->setTexture(*texLaser);

	float tamX = spriteAtaqueEspecial->getTexture()->getSize().x;
	float tamY = spriteAtaqueEspecial->getTexture()->getSize().y;

	sf::IntRect frame(frameEspecial * (tamX / cantFrames), 0 * (tamY), tamX / cantFrames, tamY);
	spriteAtaqueEspecial->setTextureRect(frame);

	spriteAtaqueEspecial->setOrigin(spriteAtaqueEspecial->getGlobalBounds().width / 2, spriteAtaqueEspecial->getGlobalBounds().height / 2);

	laserSize = spriteAtaqueEspecial->getGlobalBounds().height;
}

void AtaqueEspecial::cargarTexturasDeOnda()
{
	texWave->loadFromFile("Sprites/Special/Wave.png");

	spriteAtaqueEspecial->setTexture(*texWave);


	float tamX = spriteAtaqueEspecial->getTexture()->getSize().x;
	float tamY = spriteAtaqueEspecial->getTexture()->getSize().y;

	sf::IntRect frame(frameEspecial * (tamX / cantFrames), 0 * (tamY), tamX / cantFrames, tamY);
	spriteAtaqueEspecial->setTextureRect(frame);
	spriteAtaqueEspecial->setOrigin(spriteAtaqueEspecial->getGlobalBounds().width / 2, spriteAtaqueEspecial->getGlobalBounds().height / 2);

}

void AtaqueEspecial::animar()
{
	float tamX = spriteAtaqueEspecial->getTexture()->getSize().x;
	float tamY = spriteAtaqueEspecial->getTexture()->getSize().y;

	sf::IntRect frame(frameEspecial * (tamX / cantFrames), 0 * (tamY), tamX / cantFrames, tamY);
	spriteAtaqueEspecial->setTextureRect(frame);
	frameEspecial++;
	if (frameEspecial >= cantFrames) { frameEspecial = 0; }

}

void AtaqueEspecial::draw(sf::RenderTarget& target, sf::RenderStates states) const
{
	if (activo) {
		target.draw(*spriteAtaqueEspecial, states);
	}

}

void AtaqueEspecial::actualizarEspecial(float t)
{
	if (activo) {
		cdAE += t;
		spriteAtaqueEspecial->move(0, velocidad * t * 60);

		switch (eleccion)
		{
		case 1:
			if (spriteAtaqueEspecial->getPosition().y < -5.f)
			{
				activo = false;
			}
			if (spriteAtaqueEspecial->getPosition().y < 70.f)
			{
				detonado = true;
			}
			if (detonado && cdAE > 0.2f) {
				spriteAtaqueEspecial->setTexture(texExplosion[expFrame]);
				expFrame++;
				cdAE = 0;
				velocidad = 0;

			}
			if (expFrame > 7) {
				detonado = false;
				activo = false;
				expFrame = 0;
				velocidad = -5;
				cdAE = 0;
				spriteAtaqueEspecial->setTexture(*texBomb);
				spriteAtaqueEspecial->setPosition(lastPos);
			}
			break;
		case 2:
			if (cdAE > 0.2) {
				animar();
				cdAE = 0;
			}

			break;
		case 3:
			if (cdAE > 0.2) {
				animar();
				cdAE = 0;
			}
			if (spriteAtaqueEspecial->getPosition().y < -5)
			{
				activo = false;
			}

			break;
		default:
			break;
		}
	}
}

bool AtaqueEspecial::getActivo()
{
	return activo;
}

void AtaqueEspecial::activarEspecial(sf::Vector2f pos)
{
	activo = true;
	spriteAtaqueEspecial->setPosition(pos);
	lastPos = pos;
}

int AtaqueEspecial::getTamanioLaser()
{
	return laserSize;
}

sf::Sprite AtaqueEspecial::getSpriteEspecial()
{
		return *spriteAtaqueEspecial;
	
}

bool AtaqueEspecial::getDetonado()
{
	return detonado;
}

void AtaqueEspecial::detonar()
{
	
	detonado = true;
}
