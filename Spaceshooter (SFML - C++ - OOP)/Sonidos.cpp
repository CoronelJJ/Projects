#include "Sonidos.h"

Sonidos::Sonidos()
{
	Disparo1B = new sf::SoundBuffer;
	Disparo2B = new sf::SoundBuffer;
	Disparo3B = new sf::SoundBuffer;

	Especial1B = new sf::SoundBuffer;
	Especial2B = new sf::SoundBuffer;
	Especial3B = new sf::SoundBuffer;

	ExplosionB = new sf::SoundBuffer;

	DanioNaveB = new sf::SoundBuffer;
	DanioEnemigoB = new sf::SoundBuffer;

	PickUpB = new sf::SoundBuffer;

	Blip1B = new sf::SoundBuffer;

	VictoryB = new sf::SoundBuffer;

	Disparo1B->loadFromFile("Sounds/Disparo1.wav");
	Disparo2B->loadFromFile("Sounds/Disparo2.wav");
	Disparo3B->loadFromFile("Sounds/Disparo3.wav");

	Especial1B->loadFromFile("Sounds/Especial1.wav");
	Especial2B->loadFromFile("Sounds/Especial2.wav");
	Especial3B->loadFromFile("Sounds/Especial3.wav");

	ExplosionB->loadFromFile("Sounds/Explosion.wav");

	DanioNaveB->loadFromFile("Sounds/HitS.wav");
	DanioEnemigoB->loadFromFile("Sounds/HitE.wav");

	PickUpB->loadFromFile("Sounds/PickUp.wav");

	Blip1B->loadFromFile("Sounds/Blip.wav");

	VictoryB->loadFromFile("Sounds/fight.wav");

	Disparo1= new sf::Sound;
	Disparo2 = new sf::Sound;
	Disparo3 = new sf::Sound;

	Especial1 = new sf::Sound;
	Especial2 = new sf::Sound;
	Especial3 = new sf::Sound;

	Explosion = new sf::Sound;

	DanioNave = new sf::Sound;
	DanioEnemigo = new sf::Sound;

	PickUp = new sf::Sound;

	Blip1 = new sf::Sound;

	Victory = new sf::Sound;

	Disparo1->setBuffer(*Disparo1B);
	Disparo2->setBuffer(*Disparo2B);
	Disparo3->setBuffer(*Disparo3B);

	Especial1->setBuffer(*Especial1B);
	Especial2->setBuffer(*Especial2B);
	Especial3->setBuffer(*Especial3B);

	Explosion->setBuffer(*ExplosionB);

	DanioNave->setBuffer(*DanioNaveB);
	DanioEnemigo->setBuffer(*DanioEnemigoB);
	DanioEnemigo->setVolume(70.f);

	PickUp->setBuffer(*PickUpB);

	Blip1->setBuffer(*Blip1B);

	Victory->setBuffer(*VictoryB);

}

void Sonidos::playDisparo(int opcion)
{
	switch (opcion)
	{
	case 1:
		Disparo1->play();
		break;
	case 2:
		Disparo2->play();
		break;
	case 3:
		Disparo3->play();
		break;
	default:
		break;
	}
}

void Sonidos::playEspecial(int opcion)
{
	switch (opcion)
	{
	case 1:
		Especial1->play();
		break;
	case 2:
		Especial2->play();
		break;
	case 3:
		Especial3->play();
		break;
	default:
		break;
	}
}

void Sonidos::playExplosion()
{
	Explosion->play();
}

void Sonidos::playDanioEnemigo()
{
	DanioEnemigo->play();
}

void Sonidos::playDanioNave()
{
	DanioNave->play();
}

void Sonidos::playPickUp()
{
	PickUp->play();
}

void Sonidos::playBlip()
{
	Blip1->play();
}

void Sonidos::playVictory()
{
	Victory->play();
}
