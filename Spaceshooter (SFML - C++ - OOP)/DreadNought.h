#pragma once
#include "Nave.h"
class DreadNought :
    public Nave
{
public:
    DreadNought();
    sf::Sprite getSpriteAtkEspecial();
    void activarEspecial();
    void actualizarEspecial(float t);
    bool mostrarAtkEsp();
    void reiniciarEspecial();
    void animarEspecial();
    void centrarEspecial();
    float ySize();
    void setPosicionEspecial(int pos);

private:
    sf::Texture* texAtkEpecial;
    sf::Sprite* spriteAtkEpecial;

    bool mostrarEspecial;
    float cdAE;
    int cantFrames,frameEspecial;

};

