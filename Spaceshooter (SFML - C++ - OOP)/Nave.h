#pragma once
#include "SFML/Graphics.hpp"

class Nave 
{
protected:
	sf::Texture* texNave1;
	sf::Texture* texNave2;
	sf::Texture* texNave3;
	sf::Texture* texFuego1;
	sf::Texture* texFuego2;
	sf::Texture* texFuego3;
	sf::Texture* texEscudo1;
	sf::Texture* texEscudo2;
	sf::Texture* texEscudo3;
	sf::Texture* texArmas1;
	sf::Texture* texArmas2;
	sf::Texture* texArmas3;
	sf::Texture* texDestruccion1;
	sf::Texture* texDestruccion2;
	sf::Texture* texDestruccion3;


	sf::Sprite* spriteNave;
	sf::Sprite* spriteFuego;
	sf::Sprite* spriteEscudo;
	sf::Sprite* spriteArmas;
	sf::Sprite* spriteDestruccion;

	sf::Vector2i _velocidad;
	sf::Vector2f PosA1,PosA2,PosCen,scale;
	int vida,vidaBase, numeroFrame,elegida, frameArma,frameEscudo,frameFuego,frameDestruccion,cantVidas,cantVidasMax;
	bool escudoActivo, inciarFuego, iniciarEscudo, inciarArmas,naveActiva,destruir;
	float cdf,cde,cda,cdd,naveTime,offCenter,animacionArma;

	void animar(sf::Sprite* spt);
	void centrarSprites(int eleccion);
	void seguirNave();
	int contarFrames(sf::Sprite* spt);
	void animar(sf::Sprite* spt, int NumeroFrame2,int cant);
	void escalar();

public:
	Nave(int eleccion=1);
	sf::Sprite getSpriteNave();
	sf::Sprite getSpriteFuego();
	sf::Sprite getSpriteEscudo();
	sf::Sprite getSpriteArmas();
	sf::Sprite getSpriteDestruccion();
	
	
	sf::FloatRect getHitBox();
	bool estadoEscudo();
	void moverNave(int direccion, float dt);
	void animarFuego(float dt);
	void animarArmas(float gameTime);
	void animarEscudo(float dt);
	void animarDestruccion(float dt);
	


	void modificarVida(int nuevo);
	void evaluarVida();
	bool naveViva();
	void revivirNave();

	void aplicarEfectoDePickUp(int efecto);
	int getVidaActual();
	int getCantVidas();

	

	sf::Vector2f getPosicion();
	sf::Vector2f getPosArma1();
	sf::Vector2f getPosArma2();
	sf::Vector2f getPosArmaCentral();


};

