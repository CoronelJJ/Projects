#pragma once
#include <SFML/Graphics.hpp>
#include <SFML/Audio.hpp>
#include <iostream>
#include "Disparo.h"
#include "Nave.h"
#include "Planeta.h"
#include <list>
#include "PickUps.h"
#include "GameUI.h"
#include "AtaqueEspecial.h"
#include "Enemigo.h"
#include "DisparoEnemigo.h"
#include "Sonidos.h"
#include "Jugador.h"
#include "Asteroide.h"
#include "JefeFinal.h"
#include<iostream>
#include<cstdlib>

using namespace sf;
using namespace std;

class Juego
{
private:
	RenderWindow* ventana;

	int fps,eleccion;
	Texture* texFondo;
	

	Sprite* sptFondo;
	

	Event* evento1;

	Vector2i posMouse;
	Color myColor;

	Clock* clock1;
	Time* time1;
	Clock clock2;
	Time time2;
	Clock clockDT;
	Clock clockET;
	float dt,et, velocidad, AfterHit,MedidorT1,ultimaRotacion,cdArmas;
	bool hit, spam,pause;
	
	Planeta* tierra;

	//Sonido

	Sonidos* sonido;

	//SoundBuffer* buffer; //Archivo "textura"
	//Sound* sonido;//Sonido "sprite"

	Music* intro;
	Music* bossTheme;



	//Disparo


	
	list<Disparo> proyectiles;
	float recargaArmas;
	float laserDuration;
	bool laserActivo;
	int multiplicador;
	int cargasDeEspecial;
	float recargaEspecial;
	bool rClick;


	//Nave

	Nave* espacial;
	Vector2f posicionNave,posicionArma1,posicionArma2;
	
	
	//Pick up
	list<Asteroide> asteroides;
	list<PickUps> drops;

	bool MCR;
	float boostT,asteroideT;


	//UI
	GameUI* gameInterface;
	bool tapKey,gameOver, tapKeyP, tapKeyEsc;
	//Jugador* piloto;
	int puntosDePartida;

	//Especial
	AtaqueEspecial* poderEspecial;
	list<AtaqueEspecial> laser;
	float cdDanioEspecial,cdRecargaEspecial;


	//Enemigos
	list<Enemigo> ejercitoEnemigo;
	list<DisparoEnemigo> ataquesEnemigos;
	bool tapKeyR,bossTime,bonusFinal;
	float spawnT;
	int tipoEnemigo;
	JefeFinal* comandante;

	//Dificultad
	float vidaEnemigos,tDeJuego;
	int cantMaxEnemigos,dificultad;

	 void jugando();

	 void mostrarPantalla();
	 void procesarEventos();
	 void detectarMouse();
	 void actualizarDT();
	 void actualizarET();
	 void cdDanio();
	 void dibujarNave();
	 void dibujarProyectil();
	 void dibujarLaser();
	 void dibujarPickUp();
	 void dibujarEspecial();
	 void aplicarAtaqueEspecial();
	 void evaluarTeclas();
	 void evaluarMouseClick();
	 void cargarEspecial();
	 void dibujarProyectilesEnemigos();
	 void crearEnemigos();
	 void dibujarEnemigos();
	 void dibujarAsteroides();
	 void actualizarUI();
	 void aumentarDificultad();
	 void finDeJuego();
	 void spawnBoss();

public:

	 Juego(int naveElegida, Jugador* piloto);
	 int getPuntajeFinal();

};


