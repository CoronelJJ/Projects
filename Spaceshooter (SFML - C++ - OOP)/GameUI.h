#pragma once
#include "SFML/Graphics.hpp"
#include <string>

class GameUI : public sf::Drawable
{
public:
	GameUI(std::string piloto, int maxhp);
	void updateHP(int hp);
	void updateScore(int score);
	void updateLives(int lives);
	void updateSpecialCharges(int charges);
	void finDeJuego(bool victoria);


private:
	sf::Font* UIFont;
	sf::Text* textPoints;
	sf::Text* textLives;
	sf::Text* textPlayerName;
	sf::Text* textReturn;

	sf::Texture* texHPBar;
	sf::Texture* texHPDot;
	sf::Texture* texMainBar;
	sf::Texture* texSpecialBar;
	sf::Texture* texSpecialDot;
	sf::Texture* texLose;
	sf::Texture* texWin;
	sf::Texture* texCuadro;

	sf::Sprite* spriteHPBar;
	sf::Sprite* spriteHPDot;
	sf::Sprite* spriteMainBar;
	sf::Sprite* spriteSpecialBar;
	sf::Sprite* spriteSpecialDot;
	sf::Sprite* spriteLose;
	sf::Sprite* spriteWin;
	sf::Sprite* spriteCuadro;

	int HitPoints,TotalLives,TotalScore,maxHP,specialCounter;
	bool defeat,victory;

	void draw(sf::RenderTarget& target, sf::RenderStates states)const;

};

