#include "Menu.h"

Menu::Menu()
{
	mostrarTitulo = true;
	opcionElegida = false;
	terminado = false;
	cerrarVentana = false;
	nombreIngresado = false;
	naveElegida = 0;
	sonar = true;

	tablaPuntajes = new TablaDePuntuaciones;
	
	texTitulo = new sf::Texture;
	texFondo = new sf::Texture;
	texFondoHangar = new sf::Texture;
	texCuadro = new sf::Texture;
	texPlayOn = new sf::Texture;
	texPlayOff = new sf::Texture;
	texExitOn = new sf::Texture;
	texExitOff = new sf::Texture;
	texRatingOn = new sf::Texture;
	texRatingOff = new sf::Texture;
	texDotOn = new sf::Texture;
	texDotOff = new sf::Texture;
	texNaveB = new sf::Texture;
	texNaveD = new sf::Texture;
	texNaveT = new sf::Texture;
	texPiloto = new sf::Texture;
	texHangar = new sf::Texture;
	texCuadro1 = new sf::Texture;
	texCuadro2 = new sf::Texture;
	texCloud1 = new sf::Texture;
	texCloud2 = new sf::Texture;
	texBackOn = new sf::Texture;
	texBackOff = new sf::Texture;

	texTitulo->loadFromFile("Sprites/Menu/titulo.jpg");
	texFondo->loadFromFile("Sprites/Menu/Space.png");
	texFondoHangar->loadFromFile("Sprites/Menu/Hangar.jpg");
	texCuadro->loadFromFile("Sprites/Menu/Window.png");
	texPlayOn->loadFromFile("Sprites/Menu/PlayOn.png");
	texPlayOff->loadFromFile("Sprites/Menu/PlayOff.png");
	texExitOn->loadFromFile("Sprites/Menu/CloseOn.png");
	texExitOff->loadFromFile("Sprites/Menu/CloseOff.png");
	texRatingOn->loadFromFile("Sprites/Menu/RatingOn.png");
	texRatingOff->loadFromFile("Sprites/Menu/RatingOff.png");
	texDotOn->loadFromFile("Sprites/Menu/Dot_02.png");
	texDotOff->loadFromFile("Sprites/Menu/Dot_01.png");
	texNaveB->loadFromFile("Sprites/Menu/Battlecruiser.png");
	texNaveD->loadFromFile("Sprites/Menu/Dreadnought.png");
	texNaveT->loadFromFile("Sprites/Menu/Torpedo Ship.png");
	texPiloto->loadFromFile("Sprites/Menu/Table_01.png");
	texHangar->loadFromFile("Sprites/Menu/Header.png");
	texCuadro1->loadFromFile("Sprites/Menu/Table_02.png");
	texCuadro2->loadFromFile("Sprites/Menu/Table_03.png");
	texCloud1->loadFromFile("Sprites/Menu/Cloud_01.png");
	texCloud2->loadFromFile("Sprites/Menu/Cloud_02.png");
	texBackOn->loadFromFile("Sprites/Menu/BackOn.png");
	texBackOff->loadFromFile("Sprites/Menu/BackOff.png");

	spriteTitulo = new sf::Sprite;
	spriteFondo = new sf::Sprite;
	spriteFondoHangar = new sf::Sprite;
	spriteCuadro = new sf::Sprite;
	spritePlayOn = new sf::Sprite;
	spritePlayOff = new sf::Sprite;
	spriteExitOn = new sf::Sprite;
	spriteExitOff = new sf::Sprite;
	spriteRatingOn = new sf::Sprite;
	spriteRatingOff = new sf::Sprite;
	spriteDotOn = new sf::Sprite[3];
	spriteDotOff = new sf::Sprite[3];
	spriteNaveB = new sf::Sprite;
	spriteNaveD = new sf::Sprite;
	spriteNaveT = new sf::Sprite;
	spritePiloto = new sf::Sprite;
	spriteHangar = new sf::Sprite;
	spriteCuadro1 = new sf::Sprite;
	spriteCuadro2 = new sf::Sprite;
	spriteCloud1 = new sf::Sprite;
	spriteCloud2 = new sf::Sprite;
	spriteBackOn = new sf::Sprite;
	spriteBackOff = new sf::Sprite;

	spriteTitulo->setTexture(*texTitulo);
	spriteFondo->setTexture(*texFondo);
	spriteFondoHangar->setTexture(*texFondoHangar);
	spriteCuadro->setTexture(*texCuadro);
	spritePlayOn->setTexture(*texPlayOn);
	spritePlayOff->setTexture(*texPlayOff);
	spriteExitOn->setTexture(*texExitOn);
	spriteExitOff->setTexture(*texExitOff);
	spriteRatingOn->setTexture(*texRatingOn);
	spriteRatingOff->setTexture(*texRatingOff);
	for (int i = 0;i < 3;i++) {
		spriteDotOn[i].setTexture(*texDotOn);
		spriteDotOn[i].setScale(2.f, 2.f);
		spriteDotOn[i].setOrigin(spriteDotOn[i].getLocalBounds().width / 2, spriteDotOn[i].getLocalBounds().height / 2);

		spriteDotOff[i].setTexture(*texDotOff);
		spriteDotOff[i].setScale(2.f, 2.f);
		spriteDotOff[i].setOrigin(spriteDotOff[i].getLocalBounds().width / 2, spriteDotOff[i].getLocalBounds().height / 2);


	}
	spriteNaveB->setTexture(*texNaveB);
	spriteNaveD->setTexture(*texNaveD);
	spriteNaveT->setTexture(*texNaveT);
	spritePiloto->setTexture(*texPiloto);
	spriteHangar->setTexture(*texHangar);
	spriteCuadro1->setTexture(*texCuadro1);
	spriteCuadro2->setTexture(*texCuadro2);
	spriteCloud1->setTexture(*texCloud1);
	spriteCloud2->setTexture(*texCloud2);
	spriteBackOn->setTexture(*texBackOn);
	spriteBackOff->setTexture(*texBackOff);

	//MENU
	spriteTitulo->setScale(800.f / (float)spriteTitulo->getTexture()->getSize().x, 600.f / (float)spriteTitulo->getTexture()->getSize().y);
	spriteFondo->setScale(800.f / (float)spriteFondo->getTexture()->getSize().x, 600.f / (float)spriteFondo->getTexture()->getSize().y);//Tamaño de ventana
	centrarOrigen(spriteCuadro);
	spriteCuadro->setScale(0.4f, 0.4f);
	spriteCuadro->setPosition(400.f, 300.f);

	centrarOrigen(spritePlayOff);
	spritePlayOff->setScale(0.5f, 0.5f);
	spritePlayOff->setPosition(400.f, 190.f);
	centrarOrigen(spritePlayOn);
	spritePlayOn->setScale(0.5f, 0.5f);
	spritePlayOn->setPosition(400.f, 190.f);

	centrarOrigen(spriteRatingOff);
	spriteRatingOff->setScale(0.5f, 0.5f);
	spriteRatingOff->setPosition(400.f, 350.f);
	centrarOrigen(spriteRatingOn);
	spriteRatingOn->setScale(0.5f, 0.5f);
	spriteRatingOn->setPosition(400.f, 350.f);

	centrarOrigen(spriteExitOff);
	spriteExitOff->setScale(0.5f, 0.5f);
	spriteExitOff->setPosition(400.f, 510.f);
	centrarOrigen(spriteExitOn);
	spriteExitOn->setScale(0.5f, 0.5f);
	spriteExitOn->setPosition(400.f, 510.f);

	//ELECCION NAVE

	spriteFondoHangar->setScale(800.f / (float)spriteFondoHangar->getTexture()->getSize().x, 600.f / (float)spriteFondoHangar->getTexture()->getSize().y);

	//spriteFondoHangar->setPosition(400.f, 300.f);
	spriteDotOff[0].setPosition(200.f, 200.f);
	spriteDotOn[0].setPosition(200.f, 200.f);
	centrarOrigen(spriteNaveB);
	spriteNaveB->setPosition(200.f, 200.f);

	spriteDotOff[1].setPosition(400.f, 200.f);
	spriteDotOn[1].setPosition(400.f, 200.f);
	centrarOrigen(spriteNaveD);
	spriteNaveD->setPosition(400.f, 200.f);

	spriteDotOff[2].setPosition(600.f, 200.f);
	spriteDotOn[2].setPosition(600.f, 200.f);
	centrarOrigen(spriteNaveT);
	spriteNaveT->setPosition(600.f, 200.f);

	centrarOrigen(spritePiloto);
	spritePiloto->setScale(0.7f, 0.7f);
	spritePiloto->setPosition(200.f, 450.f);

	centrarOrigen(spriteCuadro2);
	spriteCuadro2->setScale(0.9f, 0.8f);
	spriteCuadro2->setPosition(450.f, 450.f);
	teclas = new IngresarTexto(335.f, 425.f);

	centrarOrigen(spriteCuadro1);
	spriteCuadro1->setScale(0.5f, 0.5f);
	spriteCuadro1->setPosition(400.f, 50.f);
	centrarOrigen(spriteHangar);
	spriteHangar->setScale(0.5f, 0.5f);
	spriteHangar->setPosition(400.f, 50.f);

	centrarOrigen(spriteCloud2);
	spriteCloud2->setScale(0.4f, 0.3f);

	spriteCloud2->setPosition(440.f, 450.f);

	centrarOrigen(spriteBackOff);
	spriteBackOff->setScale(0.3f, 0.3f);
	spriteBackOff->setPosition(50.f, 50.f);

	centrarOrigen(spriteBackOn);
	spriteBackOn->setScale(0.3f, 0.3f);
	spriteBackOn->setPosition(50.f, 50.f);

	//Texto
	fuente = new sf::Font;
	fuente->loadFromFile("Sprites/Menu/neuropol x rg.otf");

	textoTitulo = new sf::Text;
	textoIniciar = new sf::Text;
	textoJugar = new sf::Text;
	textoPuntuaciones = new sf::Text;
	textoSalir = new sf::Text;
	textoIdentificar = new sf::Text;

	textoTitulo->setFont(*fuente);
	textoIniciar->setFont(*fuente);
	textoJugar->setFont(*fuente);
	textoPuntuaciones->setFont(*fuente);
	textoSalir->setFont(*fuente);
	textoIdentificar->setFont(*fuente);

	textoIniciar->setString("Haz CLICK para iniciar");
	textoIniciar->setCharacterSize(20);
	textoIniciar->setFillColor(sf::Color::Green);
	textoIniciar->setOutlineThickness(1);
	textoIniciar->setOutlineColor(sf::Color::Black);
	textoIniciar->setPosition(225.f, 550.f);

	textoTitulo->setString("ULTIMATE TERRAN NEOSQUAD");
	textoTitulo->setCharacterSize(15);
	textoTitulo->setFillColor(sf::Color::Yellow);
	textoTitulo->setStyle(sf::Text::Bold);
	textoTitulo->setPosition(225.f, 40.f);

	textoJugar->setString("JUGAR");
	textoJugar->setCharacterSize(23);
	textoJugar->setPosition(350.f, 90.f);

	textoPuntuaciones->setString("PUNTUACIONES ALTAS");
	textoPuntuaciones->setCharacterSize(23);
	textoPuntuaciones->setPosition(222.f, 260.f);

	textoSalir->setString("SALIR");
	textoSalir->setCharacterSize(23);
	textoSalir->setPosition(350.f, 420.f);

	textoIdentificar->setString("¡IDENTIFIQUESE PILOTO!");
	textoIdentificar->setFillColor(sf::Color::Yellow);
	textoIdentificar->setCharacterSize(16);
	textoIdentificar->setPosition(306.f, 400.f);

	menuMusic = new sf::Music;
	//menuMusic->openFromFile("Sounds/DeepSpaceB.wav");
	menuMusic->openFromFile("Sounds/Music_BG.wav");
	menuMusic->setVolume(50);
	menuMusic->play();
	menuMusic->setLoop(true);

}

void Menu::getMousePos(sf::Vector2i mousePos)
{
	posMouse = mousePos;
}

void Menu::getMouseClick(sf::Vector2i mouseClick)
{
	if (mostrarTitulo) {
		if (spriteTitulo->getGlobalBounds().contains((sf::Vector2f)mouseClick)){
			mostrarTitulo = false;
		}
	}
	else {
		if (!opcionElegida) {
			if (spritePlayOff->getGlobalBounds().contains((sf::Vector2f)mouseClick)) {
				opcionElegida = true;
				eleccionDeMenu = 1;
				sonido.playBlip();

			}
			if (spriteRatingOff->getGlobalBounds().contains((sf::Vector2f)mouseClick)) {
				opcionElegida = true;
				eleccionDeMenu = 2;
				sonido.playBlip();
			}
			if (spriteExitOff->getGlobalBounds().contains((sf::Vector2f)mouseClick)) {
				menuMusic->stop();
				cerrarVentana = true;
			}
		}
		else {
			if (spriteDotOff[0].getGlobalBounds().contains((sf::Vector2f)posMouse)) {
				naveElegida = 1;
				sonido.playBlip();
			}


			if (spriteDotOff[1].getGlobalBounds().contains((sf::Vector2f)posMouse)) {
				naveElegida = 2;
				sonido.playBlip();
			}


			if (spriteDotOff[2].getGlobalBounds().contains((sf::Vector2f)posMouse)) {
				naveElegida = 3;
				sonido.playBlip();
			}
			if (spriteBackOff->getGlobalBounds().contains((sf::Vector2f)posMouse)) {
				opcionElegida = false;
				sonido.playBlip();
			}
		}
	}
}

bool Menu::getCerrarVentana()
{
	return cerrarVentana;
}

void Menu::volver()
{
	opcionElegida = false;
}

void Menu::recibirTeclas(sf::Event tecla)
{
	if (!teclas->getValido()) {
		teclas->setNombre(tecla);
		nombreIngresado = false;
	}
	else { nombreIngresado = true; }
}

bool Menu::getTerminado()
{
	if (nombreIngresado && (naveElegida != 0)) {
		terminado = true;
		menuMusic->stop();
	}
	else { terminado = false; }
	
	return terminado;
}

int Menu::getNaveElegida()
{
	return naveElegida;
}

const char* Menu::getNombreElegido()
{
	return teclas->getNombre();
}

void Menu::reiniciarMenu()
{
	terminado = false;
	naveElegida = 0;
	nombreIngresado = false;
	menuMusic->play();
	teclas->reiniciarNombre();
	tablaPuntajes->cargarArchivoParaMostrar();
}



void Menu::centrarOrigen(sf::Sprite* spt)
{
	spt->setOrigin(spt->getLocalBounds().width / 2,spt->getLocalBounds().height / 2);

}



void Menu::draw(sf::RenderTarget& target, sf::RenderStates states) const
{
	if (mostrarTitulo) {
		target.draw(*spriteTitulo, states);
		target.draw(*textoIniciar, states);
	}
	else {
		target.draw(*spriteFondo, states);

		if (!opcionElegida) {
			target.draw(*spriteCuadro, states);

			if (spritePlayOff->getGlobalBounds().contains((sf::Vector2f)posMouse)) {
				target.draw(*spritePlayOn, states);


			}
			else {
				target.draw(*spritePlayOff, states);
			}
			if (spriteRatingOff->getGlobalBounds().contains((sf::Vector2f)posMouse)) {
				target.draw(*spriteRatingOn, states);

			}
			else {
				target.draw(*spriteRatingOff, states);
			}
			if (spriteExitOff->getGlobalBounds().contains((sf::Vector2f)posMouse)) {
				target.draw(*spriteExitOn, states);

			}
			else {
				target.draw(*spriteExitOff, states);
			}


			target.draw(*textoTitulo, states);
			target.draw(*textoJugar, states);
			target.draw(*textoPuntuaciones, states);
			target.draw(*textoSalir, states);
		}

		if (opcionElegida)
		{
			switch (eleccionDeMenu)
			{
			case 1:
				target.draw(*spriteFondoHangar, states);

				if (spriteDotOff[0].getGlobalBounds().contains((sf::Vector2f)posMouse) || (naveElegida == 1)) {
					target.draw(spriteDotOn[0], states);

				}
				else { target.draw(spriteDotOff[0], states); }

				if (spriteDotOff[1].getGlobalBounds().contains((sf::Vector2f)posMouse) || (naveElegida == 2)) {
					target.draw(spriteDotOn[1], states);

				}
				else { target.draw(spriteDotOff[1], states); }

				if (spriteDotOff[2].getGlobalBounds().contains((sf::Vector2f)posMouse) || (naveElegida == 3)) {
					target.draw(spriteDotOn[2], states);

				}
				else { target.draw(spriteDotOff[2], states); }


				target.draw(*spriteCuadro1, states);
				target.draw(*spriteHangar, states);
				target.draw(*spriteNaveB, states);
				target.draw(*spriteNaveD, states);
				target.draw(*spriteNaveT, states);

				target.draw(*spritePiloto, states);
				//target.draw(*spriteCuadro2, states);
				target.draw(*spriteCloud2, states);

				target.draw(*textoIdentificar, states);
				target.draw(*teclas, states);

				if (spriteBackOff->getGlobalBounds().contains((sf::Vector2f)posMouse)) {
					target.draw(*spriteBackOn, states);

				}
				else {
					target.draw(*spriteBackOff, states);
				}

				break;

			case 2:
				target.draw(*tablaPuntajes, states);
				if (spriteBackOff->getGlobalBounds().contains((sf::Vector2f)posMouse)) {
					target.draw(*spriteBackOn, states);

				}
				else {
					target.draw(*spriteBackOff, states);
				}
				break;
			default:
				break;
			}
		}
	}
}
