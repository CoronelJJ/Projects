#include "Nave.h"

Nave::Nave(int eleccion)
{
	numeroFrame = 0;
	frameArma = 0;
	frameEscudo = 0;
	frameFuego = 0;
	frameDestruccion = 0;
	naveTime = 0.f;
	vida = 5;
	cantVidas = 1;///////////
	cantVidasMax = 5;
	offCenter = 0.1f;
	animacionArma = 0.1f;

	elegida = eleccion;
	cdf = 0.f;
	cde = 0.f;
	cda = 0.f;
	cdd = 0.f;
	scale.x = 0.7;
	scale.y= 0.7;
	

	texNave1 = new sf::Texture;
	texNave2 = new sf::Texture;
	texNave3 = new sf::Texture;

	texFuego1 = new sf::Texture;
	texFuego2 = new sf::Texture;
	texFuego3 = new sf::Texture;

	texEscudo1 = new sf::Texture;
	texEscudo2 = new sf::Texture;
	texEscudo3 = new sf::Texture;

	texArmas1 = new sf::Texture;
	texArmas2 = new sf::Texture;
	texArmas3 = new sf::Texture;

	texDestruccion1 = new sf::Texture;
	texDestruccion2 = new sf::Texture;
	texDestruccion3 = new sf::Texture;

	texNave1->loadFromFile("Sprites/Base1.png");
	texNave2->loadFromFile("Sprites/Base2.png");
	texNave3->loadFromFile("Sprites/Base3.png");

	texFuego1->loadFromFile("Sprites/Engine1.png");
	texFuego2->loadFromFile("Sprites/Engine2.png");
	texFuego3->loadFromFile("Sprites/Engine3.png");

	texEscudo1->loadFromFile("Sprites/Shield1.png");
	texEscudo2->loadFromFile("Sprites/Shield2.png");
	texEscudo3->loadFromFile("Sprites/Shield3.png");

	texArmas1->loadFromFile("Sprites/Weapons1.png");
	texArmas2->loadFromFile("Sprites/Weapons2.png");
	texArmas3->loadFromFile("Sprites/Weapons3.png");

	texDestruccion1->loadFromFile("Sprites/Destruction1.png");
	texDestruccion2->loadFromFile("Sprites/Destruction2.png");
	texDestruccion3->loadFromFile("Sprites/Destruction3.png");

	spriteNave = new sf::Sprite;
	spriteFuego = new sf::Sprite;
	spriteEscudo = new sf::Sprite;
	spriteArmas = new sf::Sprite;
	spriteDestruccion = new sf::Sprite;

	escudoActivo = true;
	inciarFuego = true;
	iniciarEscudo = true;
	inciarArmas = true;
	naveActiva = true;
	destruir = false;


	
	switch (eleccion)
	{
	case 1:
		spriteNave->setTexture(*texNave1);
		spriteFuego->setTexture(*texFuego1);
		animar(spriteFuego);
		spriteEscudo->setTexture(*texEscudo1);
		animar(spriteEscudo);
		spriteArmas->setTexture(*texArmas1);
		animar(spriteArmas);
		spriteDestruccion->setTexture(*texDestruccion1);
		animar(spriteDestruccion);

		vidaBase = 5;
		vida = vidaBase;
		_velocidad={ 5,5 };
		offCenter = 0.10f;
		animacionArma = 0.05f;

		break;
	case 2:
		spriteNave->setTexture(*texNave2);
		spriteFuego->setTexture(*texFuego2);
		animar(spriteFuego);
		spriteEscudo->setTexture(*texEscudo2);
		animar(spriteEscudo);
		spriteArmas->setTexture(*texArmas2);
		animar(spriteArmas);
		spriteDestruccion->setTexture(*texDestruccion2);
		animar(spriteDestruccion);

		vidaBase = 7;
		vida = vidaBase;
		_velocidad = { 4,4 };
		animacionArma = 0.18f;

		break;
	case 3:
		spriteNave->setTexture(*texNave3);
		spriteFuego->setTexture(*texFuego3);
		animar(spriteFuego);
		spriteEscudo->setTexture(*texEscudo3);
		animar(spriteEscudo);
		spriteArmas->setTexture(*texArmas3);
		animar(spriteArmas);
		spriteDestruccion->setTexture(*texDestruccion3);
		animar(spriteDestruccion);

		vidaBase = 4;
		vida = vidaBase;
		_velocidad = { 7,7 };
		offCenter = 0.30f;
		animacionArma = 0.1f;

		break;

	default:
		
		break;
	}


	centrarSprites(eleccion);
	escalar();


	spriteNave->setPosition(400, 550);
	seguirNave();
	

}

sf::Sprite Nave::getSpriteNave()
{
	return *spriteNave;
}

sf::Sprite Nave::getSpriteFuego()
{
	return *spriteFuego;
}

sf::Sprite Nave::getSpriteEscudo()
{
	return *spriteEscudo;
	
	
}

sf::Sprite Nave::getSpriteArmas()
{
	return *spriteArmas;
}

sf::Sprite Nave::getSpriteDestruccion()
{
	return *spriteDestruccion;
}

void Nave::centrarSprites(int eleccion)
{
	spriteNave->setOrigin(spriteNave->getGlobalBounds().width / 2, spriteNave->getGlobalBounds().height / 2);
	spriteFuego->setOrigin(spriteFuego->getGlobalBounds().width / 2, spriteFuego->getGlobalBounds().height/2);
	spriteArmas->setOrigin(spriteArmas->getGlobalBounds().width / 2, spriteArmas->getGlobalBounds().height / 2);
	spriteDestruccion->setOrigin(spriteEscudo->getGlobalBounds().width / 2, spriteEscudo->getGlobalBounds().height / 2);

	switch (eleccion) {
	case 1:
		spriteEscudo->setOrigin(spriteEscudo->getGlobalBounds().width / 2, spriteEscudo->getGlobalBounds().height/2 );
		break;
	case 2:
		spriteEscudo->setOrigin(spriteEscudo->getGlobalBounds().width / 2, spriteEscudo->getGlobalBounds().height /2);
		break;
	case 3:
		spriteEscudo->setOrigin(spriteEscudo->getGlobalBounds().width / 2, spriteEscudo->getGlobalBounds().height/2);
		break;

	}
	

}


void Nave::animar(sf::Sprite* spt)
{
	int cant;
	
	cant = spt->getTexture()->getSize().x / spt->getTexture()->getSize().y;
	float tamX = spt->getTexture()->getSize().x;
	float tamY = spt->getTexture()->getSize().y;

	sf::IntRect frame(numeroFrame * (tamX /cant), 0 * (tamY), tamX / cant, tamY);
	spt->setTextureRect(frame);
	numeroFrame++;
	if (numeroFrame >= cant) { numeroFrame = 0; }
}

sf::FloatRect Nave::getHitBox()
{
	return spriteNave->getGlobalBounds();
}


bool Nave::estadoEscudo()
{
	return escudoActivo;
}

void Nave::moverNave(int direccion, float dt)
{
	if (naveActiva) {
		switch (direccion)
		{
		case 1://arriba
			spriteNave->move(0, -_velocidad.y * dt * 60);
			seguirNave();
			break;
		case 2://abajo
			spriteNave->move(0, _velocidad.y * dt * 60);
			seguirNave();
			break;
		case 3://izquierda
			spriteNave->move(-_velocidad.x * dt * 60, 0);
			seguirNave();
			break;
		case 4://derecha
			spriteNave->move(_velocidad.x * dt * 60, 0);
			seguirNave();
			break;

		default:
			break;
		}
		
		if (spriteNave->getPosition().x < 0) {
			spriteNave->setPosition(0, spriteNave->getPosition().y);
		}
		if (spriteNave->getPosition().y < 0) {
			spriteNave->setPosition(spriteNave->getPosition().x,0);
		}
		if (spriteNave->getPosition().x > 800) {
			spriteNave->setPosition(800, spriteNave->getPosition().y);
		}
		if (spriteNave->getPosition().y > 600) {
			spriteNave->setPosition(spriteNave->getPosition().x,600);
		}
		
	}
}

void Nave::seguirNave()
{
	spriteFuego->setPosition(spriteNave->getPosition());
	spriteEscudo->setPosition(spriteNave->getPosition());
	spriteArmas->setPosition(spriteNave->getPosition());
	spriteDestruccion->setPosition(spriteNave->getPosition());


}

void Nave::animarFuego(float dt)
{
	
	cdf += dt;
	int cant = contarFrames(spriteFuego);
	if (cdf > 0.2 || inciarFuego) {
		animar(spriteFuego,frameFuego,cant); 
		cdf = 0.f;
		inciarFuego = false;
		frameFuego++;
	}
	if (frameFuego >= cant) { frameFuego = 0; }
}

void Nave::animarArmas(float gameTime)
{
	cda += gameTime;
	int cant = contarFrames(spriteArmas);
	if (inciarArmas|| cda>animacionArma) {
		
		inciarArmas = false;
		
		animar(spriteArmas, frameArma, cant);
		frameArma++;
		cda = 0.f;
	}
	if (frameArma >= cant) { frameArma = 0; }
}

void Nave::animarEscudo(float dt)
{
	cde += dt;
	int cant = contarFrames(spriteEscudo);
	if (cde > 0.5 || iniciarEscudo) {
		iniciarEscudo = false;

		animar(spriteEscudo,frameEscudo,cant);
		frameEscudo++;
		cde = 0.f;
		
	}
	if (frameEscudo >= cant) { frameEscudo = 0; }
}

void Nave::animarDestruccion(float dt)
{
	cdd += dt;
	int cant = contarFrames(spriteDestruccion);
	if (cdd > 0.1f) {
		destruir = false;

		animar(spriteDestruccion, frameDestruccion, cant);
		
		frameDestruccion++;
		cdd= 0.f;

	}
	if (frameDestruccion >= cant) { frameDestruccion = 0; }//return

}



void Nave::animar(sf::Sprite* spt, int NumeroFrame2,int cant) {
	float tamX = spt->getTexture()->getSize().x;
	float tamY = spt->getTexture()->getSize().y;

	sf::IntRect frame(NumeroFrame2 * (tamX / cant), 0 * (tamY), tamX / cant, tamY);
	spt->setTextureRect(frame);


}

void Nave::escalar()
{
	spriteNave->setScale(scale);
	spriteEscudo->setScale(scale);
	spriteFuego->setScale(scale);
	spriteArmas->setScale(scale);
	spriteDestruccion->setScale(scale);
}

int Nave::contarFrames(sf::Sprite* spt)
{
	int cant;

	cant = spt->getTexture()->getSize().x / spt->getTexture()->getSize().y;
	return cant;
}

void Nave::modificarVida(int nuevo)
{
	if (escudoActivo) {
		escudoActivo = false;
	}
	else { vida += nuevo; }

}

void Nave::evaluarVida()
{
	if (vida <= 0 && naveActiva) {
		naveActiva = false;
		cantVidas -= 1;
	}
}


bool Nave::naveViva()
{
	return naveActiva;
}

void Nave::revivirNave()
{
	
	naveActiva = true;
	vida = vidaBase;
	spriteNave->setPosition(400, 550);
	seguirNave();
	frameDestruccion = 0;
	
	
}

void Nave::aplicarEfectoDePickUp(int efecto)
{
	switch (efecto) {
	case 1:
		vida += 1;
		if (vida > vidaBase) { vida = vidaBase; }
		break;
	case 2:
		cantVidas += 1;
		if (cantVidas > cantVidasMax) { cantVidas = cantVidasMax; }
		break;
	case 3:
		escudoActivo = true;
		break;
	case 4:
		break;




	}

}

int Nave::getVidaActual()
{
	return vida;
}

int Nave::getCantVidas()
{
	return cantVidas;
}

sf::Vector2f Nave::getPosicion()
{
	return spriteNave->getPosition();
}

sf::Vector2f Nave::getPosArma1()
{
	
	PosA1.x = spriteNave->getPosition().x - spriteNave->getGlobalBounds().width*offCenter;
	PosA1.y = spriteNave->getGlobalBounds().top;

	return PosA1;
}

sf::Vector2f Nave::getPosArma2()
{

	PosA2.x = spriteNave->getPosition().x + spriteNave->getGlobalBounds().width * offCenter;
	PosA2.y = spriteNave->getGlobalBounds().top;

	return PosA2;
}

sf::Vector2f Nave::getPosArmaCentral()
{
	PosCen.x = spriteNave->getPosition().x;
	PosCen.y = spriteNave->getGlobalBounds().top;
	return PosCen;
}
