#include "TablaDePuntuaciones.h"

TablaDePuntuaciones::TablaDePuntuaciones()
{
	player = new Jugador;
	
	vectorPuntajes = new Jugador[10];

	texFondo = new sf::Texture;
	texTabla = new sf::Texture;

	texFondo->loadFromFile("Sprites/UI/Space.png");
	texTabla->loadFromFile("Sprites/UI/Window.png");

	textoNombre = new sf::Text[10];
	textoPuntos = new sf::Text[10];
	textoTitulo = new sf::Text;

	fuente = new sf::Font;
	fuente->loadFromFile("Sprites/UI/neuropol x rg.otf");

	textoNombre->setFont(*fuente);
	textoPuntos->setFont(*fuente);
	textoTitulo->setFont(*fuente);

	spriteFondo = new sf::Sprite;
	spriteTabla = new sf::Sprite;

	spriteFondo->setTexture(*texFondo);
	spriteTabla->setTexture(*texTabla);


	spriteFondo->setScale(800.f / (float)spriteFondo->getTexture()->getSize().x, 600.f / (float)spriteFondo->getTexture()->getSize().y);//Tamaño de ventana
	spriteTabla->setOrigin(spriteTabla->getLocalBounds().width / 2, spriteTabla->getLocalBounds().height / 2);
	spriteTabla->setScale(0.4f, 0.4f);
	spriteTabla->setPosition(400.f, 300.f);

	textoTitulo->setString("PUNTUACIONES ALTAS");
	textoTitulo->setCharacterSize(23);
	textoTitulo->setPosition(222.f, 40.f);

	for (int i = 0;i < 10; i++) {

		textoNombre[i].setPosition(240.f, 85.f + 50 * i);
		textoPuntos[i].setPosition(420.f, 85.f + 50 * i);

		textoNombre[i].setFont(*fuente);
		textoNombre[i].setCharacterSize(25);
		textoPuntos[i].setFont(*fuente);
		textoPuntos[i].setCharacterSize(25);

	}

	//archivoPuntuaciones = fopen("PuntuacionesAltas.dat", "wb");
	//hardCodeTabla();
	cargarArchivoParaMostrar();

}

void TablaDePuntuaciones::abrirArchivoModoLectura()
{
	archivoPuntuaciones = fopen("PuntuacionesAltas.dat", "rb");
}

void TablaDePuntuaciones::abrirArchivoModoSobreescribir()
{
	archivoPuntuaciones = fopen("PuntuacionesAltas.dat", "rb+");
}

void TablaDePuntuaciones::cerrarArchivo()
{
	fclose(archivoPuntuaciones);
}

bool TablaDePuntuaciones::evaluarNuevaPuntuacionAlta(Jugador jugador)
{
	abrirArchivoModoLectura();
	Jugador objJugador;
	fseek(archivoPuntuaciones, 0, 0);
	int cant = 0;
	while (fread(&objJugador, sizeof(Jugador), 1, archivoPuntuaciones) == 1) {
		if ((jugador.getPuntaje()) > objJugador.getPuntaje()) {
			cerrarArchivo();
			return true;
		}
		cant++;

	}
	cerrarArchivo();
	return false;


	

}

void TablaDePuntuaciones::modificarLista(Jugador *jugadorActual)
{
	player = jugadorActual;
	if (evaluarNuevaPuntuacionAlta(*jugadorActual)) {
		cargarPuntuacionesEnVector();
		vectorPuntajes[9] = *jugadorActual;
		ordenarVector();
		guardarVectorEnArchivo();

	}

	cargarArchivoParaMostrar();

}

void TablaDePuntuaciones::hardCodeTabla()
{
	//archivoPuntuaciones = fopen("PuntuacionesAltas.dat", "wb");
	vectorPuntajes[0].setNombre("Rose");
	vectorPuntajes[0].setPuntaje(10000);

	vectorPuntajes[1].setNombre("Pom");
	vectorPuntajes[1].setPuntaje(8500);
	vectorPuntajes[2].setNombre("TK");
	vectorPuntajes[2].setPuntaje(7950);
	vectorPuntajes[3].setNombre("Sheep");
	vectorPuntajes[3].setPuntaje(7930);
	vectorPuntajes[4].setNombre("Dino");
	vectorPuntajes[4].setPuntaje(6500);
	vectorPuntajes[5].setNombre("Priest");
	vectorPuntajes[5].setPuntaje(6400);
	vectorPuntajes[6].setNombre("Mumu");
	vectorPuntajes[6].setPuntaje(5700);
	vectorPuntajes[7].setNombre("Mum");
	vectorPuntajes[7].setPuntaje(4500);
	vectorPuntajes[8].setNombre("Hope");
	vectorPuntajes[8].setPuntaje(450);
	vectorPuntajes[9].setNombre("Santa");
	vectorPuntajes[9].setPuntaje(350);

	guardarVectorEnArchivo();

}

void TablaDePuntuaciones::cargarPuntuacionesEnVector()
{
	abrirArchivoModoLectura();
	Jugador objJugador;
	int pos = 0;
	fseek(archivoPuntuaciones, 0, 0);

	while (fread(&objJugador, sizeof(Jugador), 1, archivoPuntuaciones) == 1) {
		vectorPuntajes[pos] = objJugador;
		pos++;
	}
	cerrarArchivo();
	cargados = true;

}

bool TablaDePuntuaciones::getCargados()
{
	return cargados;
}

void TablaDePuntuaciones::ordenarVector()
{
	int iteracion = 0;
	bool permutation = true;
	int actual;

	while (permutation) {
		permutation = false;
		iteracion++;
		for (actual = 0;actual < 10 - iteracion;actual++) {
			if (vectorPuntajes[actual] < vectorPuntajes[actual + 1]) {
				permutation = true;
				// Intercambiamos los dos elementos
				Jugador temp = vectorPuntajes[actual];
				vectorPuntajes[actual] = vectorPuntajes[actual + 1];
				vectorPuntajes[actual + 1] = temp;
			}
		}
	}
}

void TablaDePuntuaciones::guardarVectorEnArchivo()
{
	abrirArchivoModoSobreescribir();
	fseek(archivoPuntuaciones, 0, 0);
	Jugador objJugador;
	for (int i = 0;i < 10;i++) {
		objJugador = vectorPuntajes[i];
		fwrite(&objJugador, sizeof(Jugador), 1, archivoPuntuaciones);


	}
	cerrarArchivo();

}

void TablaDePuntuaciones::cargarArchivoParaMostrar()
{
	cargarPuntuacionesEnVector();
	for (int i = 0;i < 10; i++) {
		textoNombre[i].setString(vectorPuntajes[i].getNombre());
		//textoNombre[i].setPosition(230.f, 70.f+60*i);
		textoPuntos[i].setString(std::to_string(vectorPuntajes[i].getPuntaje()));
		//textoPuntos[i].setPosition(230.f, 90.f + 60 * i);

		textoNombre[i].setFont(*fuente);
		textoPuntos[i].setFont(*fuente);

	}
}

void TablaDePuntuaciones::draw(sf::RenderTarget& target, sf::RenderStates states) const
{
	target.draw(*spriteFondo);
	target.draw(*spriteTabla);
	target.draw(*textoTitulo);
	
	for (int i = 0;i < 10; i++) {
		target.draw(textoNombre[i]);
		target.draw(textoPuntos[i]);


	}


}
