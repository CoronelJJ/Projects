#pragma once
#include <SFML/Audio.hpp>
class Sonidos
{
public:
	Sonidos();
	void playDisparo(int opcion);
	void playEspecial(int opcion);
	void playExplosion();
	void playDanioEnemigo();
	void playDanioNave();
	void playPickUp();
	void playBlip();
	void playVictory();

private:
	sf::SoundBuffer* Disparo1B;
	sf::SoundBuffer* Disparo2B;
	sf::SoundBuffer* Disparo3B;

	sf::SoundBuffer* Especial1B;
	sf::SoundBuffer* Especial2B;
	sf::SoundBuffer* Especial3B;

	sf::SoundBuffer* ExplosionB;

	sf::SoundBuffer* DanioNaveB;
	sf::SoundBuffer* DanioEnemigoB;

	sf::SoundBuffer* PickUpB;
	sf::SoundBuffer* Blip1B;

	sf::SoundBuffer* VictoryB;

	sf::Sound* Disparo1;
	sf::Sound* Disparo2;
	sf::Sound* Disparo3;

	sf::Sound* Especial1;
	sf::Sound* Especial2;
	sf::Sound* Especial3;

	sf::Sound* Explosion;

	sf::Sound* DanioNave;
	sf::Sound* DanioEnemigo;

	sf::Sound* PickUp;

	sf::Sound* Blip1;

	sf::Sound* Victory;

};

