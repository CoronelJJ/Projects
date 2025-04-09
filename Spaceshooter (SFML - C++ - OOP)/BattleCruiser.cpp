#include "BattleCruiser.h"

BattleCruiser::BattleCruiser()
{
	//desde nave base
	spriteNave->setTexture(*texNave1);
	spriteFuego->setTexture(*texFuego1);
	animar(spriteFuego);
	spriteEscudo->setTexture(*texEscudo1);
	animar(spriteEscudo);
	spriteArmas->setTexture(*texArmas1);
	animar(spriteArmas);
	spriteDestruccion->setTexture(*texDestruccion1);
	animar(spriteDestruccion);
	centrarSprites(1);

	vidaBase = 5;
	vida = vidaBase;
	_velocidad = { 5,5 };

	spriteNave->setPosition(100.f, 550.f);
	seguirNave();

	//propio
	texBomba = new sf::Texture;
	texExplosion = new sf::Texture[8];

	spriteAtaqueEspecial = new sf::Sprite;
	spriteExplosion = new sf::Sprite[8];

	cargarTexturasASprites();
	frameBomb = 0;
	frameExplosion = 0;
	velocidadBomba = -2;
	cdAE = 0.f;
	detonar = false;
	mostrarEspecial = false;

}

void BattleCruiser::cargarTexturasASprites()
{
	
	texBomba->loadFromFile("Sprites/Special/shot4_5.png");

	texExplosion[0].loadFromFile("Sprites/Special/shot4_exp1.png");
	texExplosion[1].loadFromFile("Sprites/Special/shot4_exp2.png");
	texExplosion[2].loadFromFile("Sprites/Special/shot4_exp3.png");
	texExplosion[3].loadFromFile("Sprites/Special/shot4_exp4.png");
	texExplosion[4].loadFromFile("Sprites/Special/shot4_exp5.png");
	texExplosion[5].loadFromFile("Sprites/Special/shot4_exp6.png");
	texExplosion[6].loadFromFile("Sprites/Special/shot4_exp7.png");
	texExplosion[7].loadFromFile("Sprites/Special/shot4_exp8.png");

	spriteAtaqueEspecial->setTexture(*texBomba);
	spriteAtaqueEspecial->setOrigin(spriteAtaqueEspecial->getGlobalBounds().width / 2, spriteAtaqueEspecial->getGlobalBounds().height / 2);
	spriteAtaqueEspecial->setScale(2.f, 2.f);
	spriteAtaqueEspecial->setRotation(-90);

	for (int i = 0;i < 8;i++) {
		spriteExplosion[i].setTexture(texExplosion[i]);
		spriteExplosion[i].setOrigin(spriteExplosion[i].getGlobalBounds().width / 2, spriteExplosion[i].getGlobalBounds().height / 2);
		spriteExplosion[i].setScale(5.f, 5.f);
		spriteExplosion[i].rotate(-90);
	}




}

void BattleCruiser::activarExplosion()
{
	detonar = true;
	velocidadBomba = 0;
	for (int i = 0;i < 8;i++) {
		spriteExplosion[i].setPosition(spriteAtaqueEspecial->getPosition());
	}
	//spriteExplosion->setPosition(spriteAtaqueEspecial->getPosition());
	
}

sf::Sprite BattleCruiser::getSpriteAtkEspecial()
{
	
	if (!detonar) {
		
		return *spriteAtaqueEspecial;
	}

	else if(detonar){
		
		return spriteExplosion[frameExplosion];
	}
}

void BattleCruiser::activarEspecial()
{
	mostrarEspecial = true;
	spriteAtaqueEspecial->setPosition(getPosicion());
	//spriteExplosion->setPosition(getPosicion());
}

void BattleCruiser::actualizarEspecial(float t)
{
	cdAE += t;
	spriteAtaqueEspecial->move(0, velocidadBomba * t * 60);
	/*for (int i = 0;i < 8;i++) {
		spriteExplosion[i].move(0, velocidadBomba * t * 60);
	}*/
	//spriteExplosion->move(0, velocidadBomba * t * 60);

	if (!detonar && cdAE > 1.5f) {
		if (frameBomb < 2) { frameBomb++; }
		cdAE = 0;
		//spriteAtaqueEspecial[frameBomb];
		
	}

	 if (detonar && cdAE > 0.2f) {
		 if (frameExplosion < 7) { frameExplosion++; };
		cdAE = 0;
		//spriteExplosion[frameExplosion];
	}
}

bool BattleCruiser::mostrarAtkEsp()
{
	return mostrarEspecial;
}

void BattleCruiser::reiniciarEspecial()
{
	velocidadBomba = -2;
	mostrarEspecial = false;
	frameExplosion = 0;
	detonar = false;
}
