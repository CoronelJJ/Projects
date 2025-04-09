#include "Disparo.h"


Disparo::Disparo(int tipo,Vector2f posicion,int multiplicador) {

	_activo = true;
	rotar = false;
	frameActual = 0;
	cantFrames = 0;
	danio = 1;
	_texDisparo1 = new Texture;
	_texDisparo1->loadFromFile("Sprites/Bolt.png");
	_texDisparo1->setSmooth(true);
	_texDisparo2 = new Texture;
	_texDisparo2->loadFromFile("Sprites/Rocket.png");
	_texDisparo3 = new Texture;
	_texDisparo3->loadFromFile("Sprites/Torpedo.png");

    _sptDisparo = new Sprite;
	switch (tipo)
	{
	case 1:
		
		_sptDisparo->setTexture(*_texDisparo1);

		
		velocidad.x = 0;
		velocidad.y = -7;
		cantFrames = 5;
		danio = 2*multiplicador;
		animarDisparo(_sptDisparo);
		centrarOrigen(_sptDisparo);
		_sptDisparo->setScale(3.f, 3.f);
		break;
	case 2:
		_sptDisparo->setTexture(*_texDisparo3);
		velocidad.x = 0;
		velocidad.y = -5;
		cantFrames = 3;
		danio = 3*multiplicador;
		animarDisparo(_sptDisparo);
		centrarOrigen(_sptDisparo);
		_sptDisparo->setScale(1.2f, 1.2f);

		break;

	case 3:
		
		_sptDisparo->setTexture(*_texDisparo2);
		velocidad.x = 0;
		velocidad.y = -4;
		cantFrames = 3;
		danio = 4*multiplicador;
		animarDisparo(_sptDisparo);
		centrarOrigen(_sptDisparo);
		_sptDisparo->setScale(1.1f, 1.1f);
		break;


	default:
		break;
	}
	eleccion = tipo;

	_sptDisparo->setPosition(posicion);

}




Sprite Disparo::getSprite()
{
		return *_sptDisparo;
	
	
	
}

void Disparo::actualizar(float t)
{

	if (rotar) { _sptDisparo->rotate(10); }
	animarDisparo(_sptDisparo);

	_sptDisparo->setPosition(_sptDisparo->getPosition().x + velocidad.x * t*60.f, _sptDisparo->getPosition().y + velocidad.y * t*60.f);
}

void Disparo::setPosicionDisparo(float enX, float enY)
{
	//posX = enX;
	//posY = enY;
	_sptDisparo->setPosition(enX, enY);
}

Sprite Disparo::centrarOrigen(Sprite *proyectil)
{
	//4.5f
	proyectil->setOrigin(proyectil->getGlobalBounds().width/2, proyectil->getGlobalBounds().height / 2);
	//proyectil->setOrigin(proyectil->getGlobalBounds().width / 2, proyectil->getTexture()->getSize().y / 2);
	
	return *proyectil;

}

void Disparo::animarDisparo(Sprite* proyectil)
{
	float tamX = proyectil->getTexture()->getSize().x;
	float tamY = proyectil->getTexture()->getSize().y;
	
	
	IntRect frame(frameActual * (tamX / cantFrames ), 0 * tamY , tamX / cantFrames, tamY);
	proyectil->setTextureRect(frame);
	frameActual++;

	if (frameActual >= cantFrames) { frameActual = 0; }



}

void Disparo::torpedo(int frame,float time)
{
	animarDisparo(_sptDisparo);
	actualizar(time);
}

FloatRect Disparo::devolverPosicion()
{
	return _sptDisparo->getGlobalBounds();
}

bool Disparo::estaActivo()
{
	return _activo;
}

void Disparo::destruir()
{
	_activo = false;
}

int Disparo::getDanio()
{
	return danio;
}

