#pragma once
#include "Nave.h"
class TorpedoShip :
    public Nave
{
public:
    TorpedoShip();
    sf::Sprite getSpriteAtkEspecial();
    void activarEspecial();
    void actualizarEspecial(float t);
    bool mostrarAtkEsp();
    void reiniciarEspecial();
    void animarEspecial();
    void centrarEspecial();

private:
    sf::Texture* texAtkEpecial;
    sf::Sprite* spriteAtkEpecial;

    bool mostrarEspecial;
    float cdAE;
    int cantFrames, frameEspecial, velocidadaEspecial;

};

