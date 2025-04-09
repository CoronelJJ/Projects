#pragma once
#include "Nave.h"
class BattleCruiser :
    public Nave
{
public:
    BattleCruiser();
    void cargarTexturasASprites();
    void activarExplosion();
    sf::Sprite getSpriteAtkEspecial();
    void activarEspecial();
    void actualizarEspecial(float t);
    bool mostrarAtkEsp();
    void reiniciarEspecial();

private:
    sf::Sprite* spriteAtaqueEspecial;
    sf::Sprite* spriteExplosion;

    sf::Texture* texBomba;
    sf::Texture* texExplosion;

    int frameBomb, frameExplosion,velocidadBomba;
    float cdAE;
    bool detonar,mostrarEspecial;


};

