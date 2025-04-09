#include "JefeFinal.h"

JefeFinal::JefeFinal()
{
	vivo = true;
	vulnerable = false;
	listo = false;
	vida = 535;
	tDeRecarga = 0.f;
	tDePatronBrazo = 0.f;
	tDePatronCabeza = 0.f;
	velocidad = 4;
	direccionX = -1;
	direccionY = 0;
	fase = 1;
	
	cargado = false;
	texHead= new sf::Texture;
	texMouth = new sf::Texture;
	texBody = new sf::Texture;
	texLArm = new sf::Texture;
	texRArm = new sf::Texture;

	texHead->loadFromFile("Sprites/Enemy/Head1.png");
	texMouth->loadFromFile("Sprites/Enemy/Head2.png");
	texBody->loadFromFile("Sprites/Enemy/BossCenter.png");
	texLArm->loadFromFile("Sprites/Enemy/BossLeft.png");
	texRArm->loadFromFile("Sprites/Enemy/BossRight.png");


	spriteHead = new sf::Sprite;
	spriteMouth = new sf::Sprite;
	spriteBody = new sf::Sprite;
	spriteLArm = new sf::Sprite;
	spriteRArm = new sf::Sprite;

	spriteHead->setTexture(*texHead);
	spriteMouth->setTexture(*texMouth);
	spriteBody->setTexture(*texBody);
	spriteLArm->setTexture(*texLArm);
	spriteRArm->setTexture(*texRArm);

	centrarSprites();
	spriteBody->setPosition(400.f, -80.f);
	spriteBody->setScale(1.5f, 1.5f);
	spriteHead->setPosition(400.f, -10.f);
	spriteHead->setScale(1.5f, 1.5f);


	//srand((unsigned)time(NULL));
	tipoBrazos = (rand() % 5) + 1;

	//srand((unsigned)time(NULL));
	tipoCabeza = (rand() % 5) + 1;


}

sf::Vector2f JefeFinal::getPosArmaDer()
{
	sf::Vector2f posDer;
	posDer.x = spriteBody->getPosition().x - spriteBody->getLocalBounds().width * 0.60f;
	posDer.y = spriteBody->getPosition().y;
	return posDer;
}

sf::Vector2f JefeFinal::getPosArmaIzq()
{
	sf::Vector2f posIzq;
	posIzq.x = spriteBody->getPosition().x + spriteBody->getLocalBounds().width * 0.60f;
	posIzq.y = spriteBody->getPosition().y;
	return posIzq;
}

sf::Vector2f JefeFinal::getPosCabeza()
{
	return spriteHead->getPosition();
}

void JefeFinal::recargar(float t)
{
	if (listo) { tDeRecarga += t; }

	switch (fase)
	{
	case 1:
		if (tDeRecarga > 0.6f) {
			cargado = true;
			tDeRecarga = 0;
		}
		else { cargado = false; }
		break;
	case 2:
		if (tDeRecarga > 0.7f) {
			cargado = true;
			tDeRecarga = 0;
		}
		else { cargado = false; }
		break;
	case 3:
		if (tDeRecarga > 0.5f) {
			cargado = true;
			tDeRecarga = 0;
		}
		else { cargado = false; }
		break;
	default:
		break;
	}
	
}

bool JefeFinal::getCargado()
{
	return cargado;
}

bool JefeFinal::getListo()
{
	return listo;
}

void JefeFinal::cambiarAtaque(float t)
{
	tDePatronBrazo += t;
	tDePatronCabeza += t;

	if (tDePatronBrazo > 6.f) {
		//srand((unsigned)time(NULL));
		tipoBrazos = (rand() % 5) + 1;

		tDePatronBrazo = 0;

	}
	if (tDePatronCabeza > 3.f) {
		
		//srand((unsigned)time(NULL));
		tipoCabeza = (rand() % 5) + 1;

		tDePatronCabeza = 0;

	}
}

int JefeFinal::getTipoBrazos()
{
	return tipoBrazos;
}


int JefeFinal::getTipoCabeza()
{
	return tipoCabeza;
}

void JefeFinal::moverJefe(float t)
{
	switch (fase)
	{
	case 2:
		if (spriteBody->getPosition().x < 100.f) {
			direccionX = 1;
		}
		if (spriteBody->getPosition().x > 700.f) {
			direccionX = -1;
		}

		spriteBody->move(velocidad * direccionX * 60 * t, 0);
		spriteHead->move(velocidad * direccionX * 60 * t, 0);
		break;
	case 3:
		if (spriteHead->getPosition().x < 50.f) {
			direccionX = 1;
		}
		if (spriteHead->getPosition().x > 750.f) {
			direccionX = -1;
		}
		if (spriteHead->getPosition().y < 50.f) {
			direccionY = 1;
		}
		if (spriteHead->getPosition().y > 150.f) {
			direccionY = -1;
		}

		spriteHead->move(velocidad * direccionX * 60 * t, velocidad * direccionY * 60 * t);
		break;
	default:
		break;
	}
	
	
	/*if (spriteBody->getPosition().x < 100.f) {
		direccion = 1;
	}
	if (spriteBody->getPosition().x > 700.f) {
		direccion = -1;
	}

	spriteBody->move(velocidad * direccion * 60 * t, 0);
	spriteHead->move(velocidad * direccion * 60 * t, 0);*/
}

void JefeFinal::recibirDanio(int danio)
{
	if (listo) {
		vida -= danio;
	}
	if (vida < 200) {
		fase = 3;
		velocidad = 6;
	}
	else if (vida < 400) {
		fase = 2;
	}

	if (vida < 0) {
		vivo = false;
	}
}

sf::Sprite JefeFinal::getSpriteCabeza()
{
	return *spriteHead;
}

sf::Sprite JefeFinal::getSpriteCuerpo()
{
	return *spriteBody;
}

int JefeFinal::getFase()
{
	return fase;
}

void JefeFinal::entrarEnPantalla(float t)
{
	if (spriteBody->getPosition().y < 80) {
		spriteBody->move(0,0.5  * 60 * t);
		spriteHead->move(0,0.5  * 60 * t);
	}
	else {
		listo = true;
	}
}

bool JefeFinal::getVivo()
{
	return vivo;
}

void JefeFinal::centrarSprites()
{
	spriteBody->setOrigin(spriteBody->getLocalBounds().width / 2, spriteBody->getLocalBounds().height / 2);
	spriteHead->setOrigin(spriteHead->getLocalBounds().width / 2, spriteHead->getLocalBounds().height / 2);
	spriteMouth->setOrigin(spriteMouth->getLocalBounds().width / 2, spriteMouth->getLocalBounds().height / 2);
}

void JefeFinal::draw(sf::RenderTarget& target, sf::RenderStates states) const
{
	
		if (fase != 3) {
			target.draw(*spriteBody, states);
			target.draw(*spriteHead, states);
		}
		else {
			target.draw(*spriteHead, states);
		}
	
}
