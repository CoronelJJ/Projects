#include "ArmarJuego.h"

ArmarJuego::ArmarJuego()
{
	Piloto = new Jugador;
    teclas = new IngresarTexto(300.f, 300.f);
	
	ventanaDeJuego = new sf::RenderWindow(VideoMode(800, 600), "Ultimate Terran Neosquad");

	teclaEsc = false;
	Lmouse = false;


}

void ArmarJuego::jugando()
{
    while (ventanaDeJuego->isOpen()) {

        while (!menuJuego.getTerminado()) {
            ventanaDeJuego->clear(Color::Blue);
            Event evento;
            while (ventanaDeJuego->pollEvent(evento))
            {
                if (evento.type == sf::Event::Closed)
                    ventanaDeJuego->close();


                menuJuego.recibirTeclas(evento);
            }


            mousePos = Mouse::getPosition(*ventanaDeJuego);
            mousePos = (Vector2i)ventanaDeJuego->mapPixelToCoords(mousePos);
            if (Mouse::isButtonPressed(Mouse::Left) && Lmouse) {
                menuJuego.getMouseClick(mousePos);
                Lmouse = false;
            }
            if (!Mouse::isButtonPressed(Mouse::Left)) {

                Lmouse = true;
            }

            menuJuego.getMousePos(mousePos);
            ventanaDeJuego->draw(menuJuego);

            if (Keyboard::isKeyPressed(Keyboard::Escape) && teclaEsc) {
                teclaEsc = false;
                menuJuego.volver();

            }
            if (!Keyboard::isKeyPressed(Keyboard::Escape)) {
                teclaEsc = true;

            }
            if (menuJuego.getCerrarVentana()) {
                ventanaDeJuego->close();
            }
            ventanaDeJuego->display();

        }
        Piloto->setNombre(menuJuego.getNombreElegido());

        UTN = new Juego(menuJuego.getNaveElegida(), Piloto);

        Piloto->setPuntaje(UTN->getPuntajeFinal());
        tabla.modificarLista(Piloto);
       
        menuJuego.reiniciarMenu();
    }
}
