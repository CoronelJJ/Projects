#include "Enemigo.h"

Enemigo::Enemigo(float multiplicador)
{
	texEnemigo1 = new sf::Texture;
	texEnemigo1->loadFromFile("Sprites/Enemy/enemigo1.png");

	texEnemigo2 = new sf::Texture;
	texEnemigo2->loadFromFile("Sprites/Enemy/enemigo2.png");

	texEnemigo3 = new sf::Texture;
	texEnemigo3->loadFromFile("Sprites/Enemy/enemigo3.png");

	texEnemigo4 = new sf::Texture;
	texEnemigo4->loadFromFile("Sprites/Enemy/enemigo4.png");

	texEnemigo5 = new sf::Texture;
	texEnemigo5->loadFromFile("Sprites/Enemy/enemigo5.png");

	spriteEnemigo = new sf::Sprite;
	
	
	vida = 50*multiplicador;
	vulnerable = false;
	listo = false;
	activo = false;
	vivo = true;
	moveT = 0.f;
	cargado = false;
	rechargeT = 1.f;
	rechargeCD = 0.f;
	minimumRecharge = 0.3f;
	posInicial = 40;
	puntos = 50;


	direccionX = 0;
	direccionY = 0;

	//srand((unsigned)time(NULL));
	elegido = (rand() % 5)+1;
	

	switch (elegido)
	{
	case 1:
		spriteEnemigo->setTexture(*texEnemigo1);
		spriteEnemigo->setScale(0.1f, 0.1f);
		puntos = 50;
		
		break;
	case 2:
		spriteEnemigo->setTexture(*texEnemigo2);
		spriteEnemigo->setScale(0.15f, 0.15f);
		spriteEnemigo->rotate(180);
		posInicial = 100;
		puntos = 75;

		break;
	case 3:
		spriteEnemigo->setTexture(*texEnemigo3);
		spriteEnemigo->setScale(0.1f, 0.1f);
		minimumRecharge = 1.3f;
		puntos = 100;

		break;
	case 4:
		spriteEnemigo->setTexture(*texEnemigo4);
		spriteEnemigo->setScale(0.1f, 0.1f);
		posInicial = 120;
		puntos = 50;
		break;
	case 5:
		spriteEnemigo->setTexture(*texEnemigo5);
		posInicial = 120;
		minimumRecharge = 0.7f;
		puntos= 50;
		break;
	default:
		break;
	}

	centrarOrigen();
	//srand((unsigned)time(NULL));
	random = (rand() % 800);
	if (random < 400) {
		random += 10;
	}
	else { random -= 10; }

	spriteEnemigo->setPosition(random, -20);

}


void Enemigo::mover(float t, float posNx)
{
	if (!activo) {
		spriteEnemigo->move(0, 3 * t * 60);
		if (spriteEnemigo->getPosition().y > posInicial) {
			activo = true;
		}

	}
	if (activo) {
		switch (elegido)
		{
		case 1:
			listo = true;
			break;
		case 2:
			patronTres(t);
			break;
		case 3:
			patronDos(t,posNx);
			break;
		case 4:
			patronUno(t);
			break;
		case 5:
			patronUno(t);


			break;
		default:
			break;
		}
	}

}
	

void Enemigo::recibirDanio(int danio)
{
	vida -= danio;
}

bool Enemigo::enemigoVivo()
{
	if (vida > 0) { vivo=true; }
	else { vivo = false; }
	return vivo;
}

sf::Vector2f Enemigo::getPosicion()
{
	cargado = false;
	return spriteEnemigo->getPosition();
}

bool Enemigo::getCargado()
{
	return cargado;
}

void Enemigo::recargar(float t)
{
	rechargeT += t;

	if (listo && !cargado && (rechargeT > rechargeCD)) {
		
		//srand((unsigned)time(NULL));
		rechargeCD =minimumRecharge + (rand() % 5)/2.f;
		rechargeT = 0;
		cargado = true;
	}




}

int Enemigo::getTipo()
{
	return elegido;
}

sf::FloatRect Enemigo::getHitBox()
{
	return spriteEnemigo->getGlobalBounds();
}

int Enemigo::getPuntos()
{
	return puntos;
}

void Enemigo::draw(sf::RenderTarget& target, sf::RenderStates states) const
{
	target.draw(*spriteEnemigo,states);
}

void Enemigo::centrarOrigen()
{
	
	spriteEnemigo->setOrigin(spriteEnemigo->getLocalBounds().width / 2.f,
		spriteEnemigo->getLocalBounds().height / 2.f);

	

}

void Enemigo::patronUno(float tiempo)
{
	if (!listo) {
		if (spriteEnemigo->getPosition().x < 400) {
			spriteEnemigo->move(-4 * tiempo * 60, 0);
		}
		if (spriteEnemigo->getPosition().x > 400) {
			spriteEnemigo->move(4 * tiempo * 60, 0);
		}
		if ((spriteEnemigo->getPosition().x < 10)) {
			listo = true;
			direccionX = 3;

		}
		if (spriteEnemigo->getPosition().x > 800) {
			listo = true;
			direccionX = -3;
		}
	}

	if (listo) {

		spriteEnemigo->move(direccionX * tiempo * 60, direccionY);

		if (spriteEnemigo->getPosition().x < 0) {

			direccionX = 3;
			direccionY = 0;
		}
		if (spriteEnemigo->getPosition().x > 800) {

			direccionX = -3;
			direccionY = 0;


		}
	}
}

void Enemigo::patronDos(float tiempo, float posX)
{
	
	moveT += tiempo;
	listo = true;


	if (moveT > 3.0f) {

		moveT = 0;
		spriteEnemigo->setPosition(posX, spriteEnemigo->getPosition().y);

	}

}

void Enemigo::patronTres(float tiempo)
{
	if (!listo) {
		if (spriteEnemigo->getPosition().x < 400) {
			spriteEnemigo->move(-4 * tiempo * 60, 0);
		}
		if (spriteEnemigo->getPosition().x > 400) {
			spriteEnemigo->move(4 * tiempo * 60, 0);
		}
		if ((spriteEnemigo->getPosition().x < 10)) {
			listo = true;
			direccionX = 3;
			direccionY = 0.5f;

		}
		if (spriteEnemigo->getPosition().x > 800) {
			listo = true;
			direccionX = -3;
			direccionY = 0.5f;
		}
	}

	if (listo) {

		spriteEnemigo->move(direccionX * tiempo * 60, direccionY * tiempo * 60);

		if (spriteEnemigo->getPosition().x < 0) {

			direccionX = 3;
			
		}
		if (spriteEnemigo->getPosition().x > 800) {

			direccionX = -3;
			

		}
		if (spriteEnemigo->getPosition().y > 150) {
			direccionY = direccionY* -1;
		}
		if (spriteEnemigo->getPosition().y < 10) {
			direccionY = direccionY* -1;
		}
	}
}
