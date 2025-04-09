#include "Juego.h"


Juego::Juego(int naveElegida, Jugador* piloto) {


	ventana = new RenderWindow(VideoMode(800, 600), "ULTIMATE TERRAN NEOSQUAD");

	ventana->setFramerateLimit(200);

	velocidad = 60.f;
	fps = 1 / 60;
	MedidorT1 = 0.f;

	
	ultimaRotacion = 0;

	cdArmas = 1.f;
	//---------------
	//eleccion = 2;
	eleccion = naveElegida;
	//-------------
	MCR = true;
	


	Color MyColor(255, 200, 135, 135); //Color personalizado RGB y Alpha (opacidad)
	
	texFondo = new Texture;
	texFondo->loadFromFile("Sprites/Menu/Space.png");
	
	

	sptFondo = new Sprite;
	
	
	sptFondo->setTexture(*texFondo);
	sptFondo->setScale(800.f / (float)sptFondo->getTexture()->getSize().x, 600.f/ (float)sptFondo->getTexture()->getSize().y);//Tamaño de ventana

	

	tierra = new Planeta(350.f,350.f);
	
	//Tiempo
	evento1 = new Event;
	clock1 = new Clock;
	time1 = new Time;
	AfterHit = 0;
	spam = true;
	

	//Sonido
	
	intro = new Music;
	intro->openFromFile("Sounds/Dyna.flac"); 
	intro->setVolume(15);
	intro->play();
	intro->setLoop(true);

	bossTheme = new Music;
	bossTheme->openFromFile("Sounds/angrymod.wav");
	bossTheme->setVolume(15);
	bossTheme->setLoop(true);


	sonido = new Sonidos;

	pause = false;

	//Nave
	espacial = new Nave(eleccion);
	posicionNave = espacial->getPosicion();



	
	
	//Armas
	list<Disparo> proyectiles;
	
	laserDuration = 0.f;
	laserActivo = false;
	multiplicador = 1;
	cargasDeEspecial = 0;
	recargaEspecial = 0.f;
	rClick = true;


	//Pick Up
	list<PickUps> drops;
	list<Asteroide> asteroides;
	asteroideT = 0;


	//UI
	gameInterface = new GameUI(piloto->getNombre(), espacial->getVidaActual());
	tapKey = true;
	puntosDePartida = 0;
	gameOver = false;
	tapKeyP = true;

	//Especial
	poderEspecial = new AtaqueEspecial(eleccion);
	list<AtaqueEspecial> laser;
	cdDanioEspecial = 1.f;

	//Enemigo
	list<Enemigo> ejercitoEnemigo;
	list<DisparoEnemigo> ataquesEnemigos;
	tapKeyR = true;
	bossTime = false;
	bonusFinal = false;
	comandante = new JefeFinal;

	//Dificultad
	vidaEnemigos = 1.f;
	cantMaxEnemigos = 3;
	tDeJuego = 0.f;
	dificultad = 1;

	switch (eleccion)
	{
	case 1:
		cdRecargaEspecial = 5.f;
		cdDanioEspecial = 1.f;
		recargaArmas = 0.2f;
		break;
	case 2:
		cdRecargaEspecial = 10.f;
		cdDanioEspecial = 1.f;
		recargaArmas = 0.3f;		
		break;
	case 3:
		cdRecargaEspecial = 7.f;
		cdDanioEspecial = 1.f;
		recargaArmas = 0.4f;
		break;

	default:
		break;
	}

	jugando();
}

int Juego::getPuntajeFinal()
{
	return puntosDePartida;
}

void Juego::mostrarPantalla() {
	ventana->clear(Color::Blue);

	ventana->draw(*sptFondo);
	

	ventana->draw(*tierra);

	dibujarEspecial();
	dibujarNave();
	dibujarProyectil();	
	dibujarPickUp();

	espacial->evaluarVida();
	

	dibujarAsteroides();
	dibujarProyectilesEnemigos();
	dibujarEnemigos();
	
	ventana->draw(*gameInterface);


	ventana->display();

	


}

void Juego::jugando() {
	
	while (ventana->isOpen()){
		
		*time1 = clock1->getElapsedTime();
		

		if (time1->asSeconds() > dt + fps) {

			
			time2 = clock2.restart();
			MedidorT1 = time2.asSeconds();
			
			
			actualizarDT();
			actualizarET();
			aumentarDificultad();
			detectarMouse();
			evaluarMouseClick();
			procesarEventos();
			evaluarTeclas();
			cdDanio();
			finDeJuego();
			
			cargarEspecial();
			aplicarAtaqueEspecial();
		
			cdArmas += dt;
			
			
			tierra->rotarPlaneta(dt);
			
			poderEspecial->actualizarEspecial(dt);

			crearEnemigos();	
			actualizarUI();
			

			mostrarPantalla();
		}
		
	}


}

void Juego::procesarEventos()
{
	while (ventana->pollEvent(*evento1));{
	
		switch (evento1->type) {

		case Event::Closed:
			ventana->close();
			exit(1);
			break;

		}


	}


}

void Juego::detectarMouse()
{

	posMouse = Mouse::getPosition(*ventana);
	posMouse = (Vector2i)ventana->mapPixelToCoords(posMouse);
	

}



void Juego::actualizarDT()
{
	
	if (!pause) {
		dt = clockDT.restart().asSeconds();//Reinicia reloj como segundos cada actualizacion/display
	}
	else { dt = 0; }

}

void Juego::actualizarET()
{
	if (!pause) {
		et = clockET.restart().asSeconds();
	}
	else { et = 0; }
}

void Juego::cdDanio()
{
	
	
	if (hit) {

		AfterHit += dt;

		if(AfterHit>0.5f) {
			
			hit = false;
			AfterHit = 0;
			spam = true;
			
		}
	}


}


void Juego::dibujarNave()
{	
	posicionNave = espacial->getPosicion() ;
	posicionArma1 = espacial->getPosArma1();
	posicionArma2 = espacial->getPosArma2();
	espacial->animarFuego(dt);
	espacial->animarEscudo(dt);

	

	if (espacial->naveViva()) {
		ventana->draw(espacial->getSpriteFuego());
			//ventana->draw(espacial->getSpriteNave());

			if (espacial->estadoEscudo()) {
				ventana->draw(espacial->getSpriteEscudo());
			}
			

		ventana->draw(espacial->getSpriteArmas());
	}
	else {
		espacial->animarDestruccion(dt);
		ventana->draw(espacial->getSpriteDestruccion());
		if (spam) {
			sonido->playExplosion();
			spam = false;
		}
		intro->stop();
		proyectiles.clear();
	}
	
}
//---------------PROYECTILES NAVE-------------------
void Juego::dibujarProyectil()
{

	if (!bossTime) {
		if (espacial->naveViva()) {
			for (Disparo& disparo : proyectiles) {
				disparo.actualizar(dt);


				for (Enemigo& bichoMalo : ejercitoEnemigo) {
					if (disparo.getSprite().getGlobalBounds().intersects(bichoMalo.getHitBox())) {
						disparo.destruir();
						bichoMalo.recibirDanio(disparo.getDanio());
						sonido->playDanioEnemigo();
					}
				}
				for (Asteroide& meteorito : asteroides) {
					if (disparo.getSprite().getGlobalBounds().intersects(meteorito.getHitBox())) {
						disparo.destruir();
						meteorito.recibirDanio(disparo.getDanio());
					}
				}


				if (disparo.getSprite().getPosition().y < -10) {
					disparo.destruir();
				}
			}

			list<Disparo>::iterator it = proyectiles.begin();

			while (it != proyectiles.end()) {
				if (!(*it).estaActivo()) {
					it = proyectiles.erase(it);

				}
				else {
					ventana->draw((*it).getSprite());
					it++;
				}


			}
		}
	}
	else {
		if (espacial->naveViva()) {
			for (Disparo& disparo : proyectiles) {
				disparo.actualizar(dt);


				if (comandante->getFase() != 3){
					if ((disparo.getSprite().getGlobalBounds().intersects(comandante->getSpriteCabeza().getGlobalBounds())) || (disparo.getSprite().getGlobalBounds().intersects(comandante->getSpriteCuerpo().getGlobalBounds()))) {
						disparo.destruir();
						comandante->recibirDanio(disparo.getDanio());
						sonido->playDanioEnemigo();

					}
				}
				else {
					if ((disparo.getSprite().getGlobalBounds().intersects(comandante->getSpriteCabeza().getGlobalBounds()))) {
						disparo.destruir();
						comandante->recibirDanio(disparo.getDanio());
						sonido->playDanioEnemigo();

					}
				}

				for (Asteroide& meteorito : asteroides) {
					if (disparo.getSprite().getGlobalBounds().intersects(meteorito.getHitBox())) {
						disparo.destruir();
						meteorito.recibirDanio(disparo.getDanio());
					}
				}


				if (disparo.getSprite().getPosition().y < -10) {
					disparo.destruir();
				}
			}

			list<Disparo>::iterator it = proyectiles.begin();

			while (it != proyectiles.end()) {
				if (!(*it).estaActivo()) {
					it = proyectiles.erase(it);

				}
				else {
					ventana->draw((*it).getSprite());
					it++;
				}


			}
		}
	}
}
//-------------LASER-------------
void Juego::dibujarLaser()
{

	//prototype o factory, creacionales
	if (laserActivo) {
		int longitud =(int)espacial->getPosArmaCentral().y / poderEspecial->getTamanioLaser();
		for (int i = 0;i < longitud;i++) {
			laser.push_back(AtaqueEspecial(2));

		}
		int pos = 0;
		for (AtaqueEspecial& beam : laser) {
			beam.activarEspecial(Vector2f(espacial->getPosArmaCentral().x,
				espacial->getPosicion().y-poderEspecial->getTamanioLaser()*pos));
			
			pos++;
		}
		list<AtaqueEspecial>::iterator it = laser.begin();

		while (it != laser.end()) {
				(*it).actualizarEspecial(dt);
				ventana->draw((*it).getSpriteEspecial());
				it++;
			


		}
		laserDuration += dt;

	}

	
	if (laserDuration > 2.8f) {
		laserDuration = 0;
		laserActivo = false;
		laser.clear();
	}


}
//------------PICK UPS---------------
void Juego::dibujarPickUp()
{
	if (!drops.empty()) {
		for (PickUps& drop : drops) {
			drop.actualizarPU(dt);
			if (espacial->getSpriteNave().getGlobalBounds().intersects(drop.getSpritePickUp().getGlobalBounds())) {

				if (drop.getEfecto() <= 3) {
					espacial->aplicarEfectoDePickUp(drop.getEfecto());
					drop.borrar();
				}
				else if (drop.getEfecto() == 4) {
					multiplicador = 2;
					drop.borrar();
				}
				sonido->playPickUp();
			}
			if (drop.getSpritePickUp().getPosition().y > 610) {
					drop.borrar();
			}
		}
		list<PickUps>::iterator it = drops.begin();

		while (it != drops.end()) {
			if (!(*it).estaActivo()) {
				it = drops.erase(it);
			}
			else {
				ventana->draw((*it).getSpritePickUp());
				it++;
			}

		}
	}

	if (multiplicador != 1) {
		boostT += dt;

	}
	if (boostT > 10) {
		multiplicador = 1;
		boostT = 0;
	}
}
//----------------ESPECIAL---------------
void Juego::dibujarEspecial()
{
	if (eleccion == 2) {
		dibujarLaser();
	}
	else { ventana->draw(*poderEspecial);
	}
}

void Juego::aplicarAtaqueEspecial()
{
	if (!bossTime) {
		if (poderEspecial->getActivo() || laserActivo) {
			for (Enemigo& bichoMalo : ejercitoEnemigo) {

				cdDanioEspecial += dt;
				switch (eleccion)
				{
				case 1:
					if (bichoMalo.getHitBox().intersects(poderEspecial->getSpriteEspecial().getGlobalBounds()) && poderEspecial->getDetonado() && cdDanioEspecial > 0.2f) {

						bichoMalo.recibirDanio(5);
						cdDanioEspecial = 0.f;
					}

					break;
				case 2:
					if (bichoMalo.getHitBox().contains(espacial->getPosArmaCentral().x, bichoMalo.getPosicion().y) && cdDanioEspecial > 0.1) {
						bichoMalo.recibirDanio(2);
						cdDanioEspecial = 0.f;
					}

					break;
				case 3:
					if (bichoMalo.getHitBox().intersects(poderEspecial->getSpriteEspecial().getGlobalBounds()) && cdDanioEspecial > 0.5f) {

						bichoMalo.recibirDanio(10);
						cdDanioEspecial = 0.f;
					}
					break;
				default:
					break;
				}


			}
		}
	}
	else {
		if (poderEspecial->getActivo() || laserActivo) {
			

				cdDanioEspecial += dt;
				switch (eleccion)
				{
				case 1:
					if ((comandante->getSpriteCabeza().getGlobalBounds().intersects(poderEspecial->getSpriteEspecial().getGlobalBounds()) && poderEspecial->getDetonado() && cdDanioEspecial > 0.2f)
						||(comandante->getSpriteCuerpo().getGlobalBounds().intersects(poderEspecial->getSpriteEspecial().getGlobalBounds()) && poderEspecial->getDetonado() && cdDanioEspecial > 0.2f)) {

						comandante->recibirDanio(5);
						cdDanioEspecial = 0.f;
					}

					break;
				case 2:
					if (((comandante->getSpriteCabeza().getGlobalBounds().contains(espacial->getPosArmaCentral().x, comandante->getPosCabeza().y)) ||
						(comandante->getSpriteCuerpo().getGlobalBounds().contains(espacial->getPosArmaCentral().x, comandante->getPosCabeza().y))) && cdDanioEspecial > 0.1) {
						comandante->recibirDanio(2);
						cdDanioEspecial = 0.f;
					}

					break;
				case 3:
					if (((comandante->getSpriteCabeza().getGlobalBounds().intersects(poderEspecial->getSpriteEspecial().getGlobalBounds()))||
						(comandante->getSpriteCuerpo().getGlobalBounds().intersects(poderEspecial->getSpriteEspecial().getGlobalBounds()))) && cdDanioEspecial > 0.5f) {

						comandante->recibirDanio(10);
						cdDanioEspecial = 0.f;
					}
					break;
				default:
					break;
				}


			}
		
	}


}
//-----------------TECLADO------------------------
void Juego::evaluarTeclas()
{
	if (ventana->hasFocus()) {
		if (Keyboard::isKeyPressed(Keyboard::Num1)) {





		}
		if (Keyboard::isKeyPressed(Keyboard::Num2)) {





		}
		/*if (Keyboard::isKeyPressed(Keyboard::Num3)) {


			espacial->modificarVida(-1);


		}*/
		if (Keyboard::isKeyPressed(Keyboard::Num4)) {


		}
		if (Keyboard::isKeyPressed(Keyboard::Num5)) {


		}
		if (Keyboard::isKeyPressed(Keyboard::Num9)) {

			
		}
		if (Keyboard::isKeyPressed(Keyboard::A)) {

			espacial->moverNave(3, dt);
		}
		if (Keyboard::isKeyPressed(Keyboard::D)) {

			espacial->moverNave(4, dt);
		}
		if (Keyboard::isKeyPressed(Keyboard::W)) {

			espacial->moverNave(1, dt);
		}
		if (Keyboard::isKeyPressed(Keyboard::S)) {

			espacial->moverNave(2, dt);
		}
		/*if (Keyboard::isKeyPressed(Keyboard::Key::R) && tapKeyR) {
			//bossTime = true;
			spawnBoss();
			tapKeyR = false;
		}
		if (!Keyboard::isKeyPressed(Keyboard::Key::R)) {
			tapKeyR = true;
		}*/

		if (Keyboard::isKeyPressed(Keyboard::Key::Escape) && tapKeyEsc) {

			intro->stop();
			bossTheme->stop();
			tapKeyEsc = false;
			ventana->close();
		}
		if (!Keyboard::isKeyPressed(Keyboard::Key::Escape)) {
			tapKeyEsc = true;

		}
		if (Keyboard::isKeyPressed(Keyboard::Key::Space)&& tapKey) {
			

				if (!espacial->naveViva() && espacial->getCantVidas() >= 0) {

					espacial->revivirNave();
					if (!bossTime) {
						intro->play();
					}
					spam = true;
				}
				tapKey = false;

			

		}
		if (!Keyboard::isKeyPressed(Keyboard::Key::Space)) {
				tapKey = true;
		}
			if (Keyboard::isKeyPressed(Keyboard::Key::P) && tapKeyP) {
				if (pause) {
					pause = false;
				}
				else {
					pause = true;
				}
				tapKeyP = false;

			}
			if (!Keyboard::isKeyPressed(Keyboard::Key::P)) {
				tapKeyP = true;
			}
	}
}
//-------------MOUSE-------------
void Juego::evaluarMouseClick()
{
	if (!gameOver) {
		if ((ventana->hasFocus()) && (Mouse::isButtonPressed(Mouse::Right)) && rClick && !poderEspecial->getActivo() && (espacial->naveViva())) {

			if (cargasDeEspecial > 0) {
				if (eleccion != 2) {
					rClick = false;
					poderEspecial->activarEspecial(espacial->getPosArmaCentral());
					sonido->playEspecial(eleccion);
					cargasDeEspecial--;
				}
				else if ((eleccion == 2) && (!laserActivo)) {
					rClick = false;
					laserActivo = true;
					sonido->playEspecial(eleccion);
					cargasDeEspecial--;

				}
				
			}

		}
		if ((ventana->hasFocus()) && (!Mouse::isButtonPressed(Mouse::Right))) {
			rClick = true;
		}


		if ((ventana->hasFocus()) && (Mouse::isButtonPressed(Mouse::Left))) {

			if (espacial->naveViva()) {
				if (eleccion != 2) { espacial->animarArmas(dt); }
				if (cdArmas > recargaArmas) {

					proyectiles.push_back(Disparo(eleccion, posicionArma1, multiplicador));
					proyectiles.push_back(Disparo(eleccion, posicionArma2, multiplicador));
					cdArmas = 0;
					sonido->playDisparo(eleccion);


				}
			}

		}
		if ((ventana->hasFocus()) && (Mouse::isButtonPressed(Mouse::Middle)) && MCR) {

			MCR = false;
		}
		if ((ventana->hasFocus()) && (!Mouse::isButtonPressed(Mouse::Middle))) {
			MCR = true;
		}
	}
}

void Juego::cargarEspecial()
{
	if (cargasDeEspecial < 3) {
	recargaEspecial += dt;
	}
	if (recargaEspecial > cdRecargaEspecial) {
		if (cargasDeEspecial < 3) {
			cargasDeEspecial++;
		}
		recargaEspecial = 0;
		
	}
	if ((eleccion == 2) && (cargasDeEspecial < 3)) {
		espacial->animarArmas(dt);
	}
	if (cargasDeEspecial < 0) { cargasDeEspecial = 0; }
}
//-------------PROYECTILES ENEMIGOS---------------------
void Juego::dibujarProyectilesEnemigos()
{
	
	//---------Enemigos----------
	if (!bossTime) {
		if (espacial->naveViva()) {
			for (Enemigo& bichoMalo : ejercitoEnemigo) {
				bichoMalo.recargar(et);
				if (bichoMalo.getCargado()) {
					ataquesEnemigos.push_back(DisparoEnemigo(bichoMalo.getTipo(), bichoMalo.getPosicion(),
						espacial->getPosicion()));
				}

			}
		}
		//--------Disparos----------
		for (DisparoEnemigo& disparoE : ataquesEnemigos) {
			disparoE.mover(et);


			if (disparoE.getSpriteAtaque().getGlobalBounds().intersects(espacial->getHitBox())) {
				disparoE.desactivar();
				if (espacial->naveViva() && !hit) {
					espacial->modificarVida(-1);
					hit = true;
					sonido->playDanioNave();

				}
			}

		}

		list<DisparoEnemigo>::iterator it = ataquesEnemigos.begin();

		while (it != ataquesEnemigos.end()) {
			if (!(*it).getActivo()) {
				it = ataquesEnemigos.erase(it);

			}
			else {
				ventana->draw((*it).getSpriteAtaque());
				it++;
			}

		}
	}
	else if (comandante->getVivo()){
		
		if (espacial->naveViva()) {
			
			comandante->recargar(et);
			comandante->cambiarAtaque(et);
			if (comandante->getCargado()) {
				if (comandante->getFase() != 3) {
					ataquesEnemigos.push_back(DisparoEnemigo(comandante->getTipoBrazos(), comandante->getPosArmaDer(),
						espacial->getPosicion()));
					ataquesEnemigos.push_back(DisparoEnemigo(comandante->getTipoBrazos(), comandante->getPosArmaIzq(),
						espacial->getPosicion()));
					ataquesEnemigos.push_back(DisparoEnemigo(comandante->getTipoCabeza(), comandante->getPosCabeza(),
						espacial->getPosicion()));
				}
				else {
					ataquesEnemigos.push_back(DisparoEnemigo(comandante->getTipoCabeza(), comandante->getPosCabeza(),
						espacial->getPosicion()));
				}
			}

			
		}
		//--------Disparos----------
		for (DisparoEnemigo& disparoE : ataquesEnemigos) {
			disparoE.mover(et);


			if (disparoE.getSpriteAtaque().getGlobalBounds().intersects(espacial->getHitBox())) {
				disparoE.desactivar();
				if (espacial->naveViva() && !hit) {
					espacial->modificarVida(-1);
					hit = true;
					sonido->playDanioNave();

				}
			}

		}

		list<DisparoEnemigo>::iterator it = ataquesEnemigos.begin();

		while (it != ataquesEnemigos.end()) {
			if (!(*it).getActivo()) {
				it = ataquesEnemigos.erase(it);

			}
			else {
				ventana->draw((*it).getSpriteAtaque());
				it++;
			}

		}
	}
}
//-------------------ENEMIGOS---------------------------
void Juego::crearEnemigos()
{
	if (!bossTime) {
		spawnT += et;

		if (spawnT > 5.f && ejercitoEnemigo.size() < cantMaxEnemigos) {
			srand((unsigned)time(NULL));
			tipoEnemigo = (rand() % 5) + 1;

			ejercitoEnemigo.push_back(Enemigo(vidaEnemigos));
			spawnT = 0;

		}
	}
	if (!gameOver) {
		asteroideT += et;
		if (asteroideT > 15.f) {
			asteroides.push_back(Asteroide());
			asteroideT = 0;
		}
	}
}

void Juego::dibujarEnemigos()
{
	if (!bossTime) {
		for (Enemigo& bichoMalo : ejercitoEnemigo) {
			bichoMalo.mover(et, espacial->getPosicion().x);



			if (espacial->naveViva() && !hit && bichoMalo.getHitBox().intersects(espacial->getHitBox())) {

				espacial->modificarVida(-10);
			}

		}

		list<Enemigo>::iterator it = ejercitoEnemigo.begin();

		while (it != ejercitoEnemigo.end()) {
			if (!(*it).enemigoVivo()) {
				puntosDePartida += (*it).getPuntos();

				it = ejercitoEnemigo.erase(it);

			}
			else {
				ventana->draw((*it));
				it++;
			}


		}
	}
	else {
		if (!comandante->getListo()) {
			comandante->entrarEnPantalla(et);
			ventana->draw(*comandante);
		}
		else if(comandante->getVivo()) {
			if (espacial->naveViva() && !hit && (comandante->getSpriteCuerpo().getGlobalBounds().intersects(espacial->getHitBox())|| comandante->getSpriteCabeza().getGlobalBounds().intersects(espacial->getHitBox()))) {

				espacial->modificarVida(-10);
			}
			comandante->moverJefe(et);
			ventana->draw(*comandante);
		}
		
		
	}

}

void Juego::dibujarAsteroides()
{
	for (Asteroide& meteorito : asteroides) {
		meteorito.actualizar(et);



		if (espacial->naveViva() && !hit && meteorito.getHitBox().intersects(espacial->getHitBox())) {

			espacial->modificarVida(-10);
		}
		if (meteorito.getSprite().getPosition().x < -60 || meteorito.getSprite().getPosition().x > 860) {
			meteorito.destruir();
		}

	}

	list<Asteroide>::iterator it = asteroides.begin();

	while (it != asteroides.end()) {
		if ((*it).getFinalizado()) {

			drops.push_back(PickUps((*it).getSprite().getPosition()));
			it = asteroides.erase(it);

		}
		else {
			ventana->draw((*it));
			it++;
		}


	}
}

void Juego::actualizarUI()
{
	gameInterface->updateHP(espacial->getVidaActual());
	gameInterface->updateLives(espacial->getCantVidas());
	gameInterface->updateSpecialCharges(cargasDeEspecial);
	gameInterface->updateScore(puntosDePartida);

	if (espacial->getCantVidas() < 0) {
		gameOver = true;
		gameInterface->finDeJuego(false);
	}

	if (bossTime && !comandante->getVivo()) {
		gameInterface->finDeJuego(true);
	}
}

void Juego::aumentarDificultad()
{
	if (!bossTime) {
		tDeJuego += et;
		if (tDeJuego > 150.f) {
			dificultad++;
			tDeJuego = 0;
			//cout << "mas dificil" << endl;
		}


		switch (dificultad)
		{
		case 1:
			vidaEnemigos = 1.f;
			cantMaxEnemigos = 3;
			break;
		case 2:
			vidaEnemigos = 1.50f;
			cantMaxEnemigos = 4;
			break;
		case 3:
			vidaEnemigos = 2.f;
			cantMaxEnemigos = 6;
			break;
		case 4:
			spawnBoss();
		default:
			break;
		}
	}

}

void Juego::finDeJuego()
{
	if (bossTime && !comandante->getVivo()) {
		
		bossTheme->stop();
		//sonido->playVictory();
		if (!bonusFinal) {
			puntosDePartida += 3000;
			bonusFinal = true;
		}
		gameOver = true;
	}
}

void Juego::spawnBoss()
{
	bossTime = true;
	intro->stop();
	bossTheme->play();
	ejercitoEnemigo.clear();
	ataquesEnemigos.clear();

}
