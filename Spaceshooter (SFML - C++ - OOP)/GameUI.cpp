#include "GameUI.h"

GameUI::GameUI(std::string piloto, int maxhp)
{
	defeat = false;
	victory = false;

	UIFont = new sf::Font;
	UIFont->loadFromFile("Sprites/UI/neuropol x rg.otf");

	textPoints = new sf::Text;
	textPoints->setFont(*UIFont);

	textLives = new sf::Text;
	textLives->setFont(*UIFont);

	textPlayerName = new sf::Text;
	textPlayerName->setFont(*UIFont);

	textReturn = new sf::Text;
	textReturn->setFont(*UIFont);

	TotalScore = 0;
	TotalLives = 3;
	HitPoints = maxhp;
	maxHP = maxhp;
	specialCounter = 0;

	textPoints->setString("PUNTUACION:\n" + std::to_string(TotalScore));
	textPoints->setStyle(sf::Text::Bold);
	textPoints->setCharacterSize(8);
	textLives->setString("VIDAS:\t" + std::to_string(TotalLives));
	textLives->setCharacterSize(12);
	textPlayerName->setString(piloto);
	textPlayerName->setCharacterSize(12);
	textReturn->setString("Pulsa ESC para volver");
	textReturn->setFillColor(sf::Color::Green);
	textReturn->setCharacterSize(20);
	textReturn->setOutlineThickness(1);
	textReturn->setOutlineColor(sf::Color::Yellow);

	texHPBar = new sf::Texture;
	texHPDot = new sf::Texture;
	texMainBar = new sf::Texture;
	texSpecialBar = new sf::Texture;
	texSpecialDot = new sf::Texture;
	texLose = new sf::Texture;
	texWin = new sf::Texture;
	texCuadro = new sf::Texture;

	texHPBar->loadFromFile("Sprites/UI/HealthBar.png");
	texHPDot->loadFromFile("Sprites/UI/HealthDot.png");
	texMainBar->loadFromFile("Sprites/UI/StatsBar.png");
	texSpecialBar->loadFromFile("Sprites/UI/SpecialBar.png");
	texSpecialDot->loadFromFile("Sprites/UI/SpecialDot.png");
	texLose->loadFromFile("Sprites/UI/HeaderLose.png");
	texWin->loadFromFile("Sprites/UI/HeaderWin.png");
	texCuadro->loadFromFile("Sprites/UI/Table.png");

	spriteHPBar = new sf::Sprite;
	spriteHPDot = new sf::Sprite[maxHP];
	spriteMainBar = new sf::Sprite;
	spriteSpecialBar = new sf::Sprite;
	spriteSpecialDot = new sf::Sprite[3];
	spriteLose = new sf::Sprite;
	spriteWin = new sf::Sprite;
	spriteCuadro = new sf::Sprite;

	spriteHPBar->setTexture(*texHPBar);
	spriteHPBar->setScale(0.383, 0.4);
	spriteSpecialBar->setTexture(*texSpecialBar);
	spriteSpecialBar->setScale(0.383, 0.4);
	for (int i = 0;i < maxHP;i++) {
		spriteHPDot[i].setTexture(*texHPDot);
		spriteHPDot[i].setScale(0.6, 0.4);

	}
	for (int j = 0;j < 3;j++) {
		spriteSpecialDot[j].setTexture(*texSpecialDot);
		spriteSpecialDot[j].setScale(1.f, 0.4f);

	}


	spriteMainBar->setTexture(*texMainBar);
	spriteMainBar->setScale(0.3, 0.3);

	spriteHPBar->setPosition(635.f, 570.f);
	spriteMainBar->setPosition(5.f, 575.f);
	spriteSpecialBar->setPosition(515.f, 570.f);
	textPoints->setPosition(124.f, 577.f);
	textLives->setPosition(233.f, 579.f);
	textPlayerName->setPosition(20.f, 579);
	textReturn->setPosition(250.f, 450.f);
	

	for (int i = 0;i < maxHP;i++) {
		spriteHPDot[i].setPosition(637.f+spriteHPDot->getGlobalBounds().width*i, 572.f);

	}
	for (int i = 0;i < 3;i++) {
		spriteSpecialDot[i].setPosition(541.f+spriteSpecialDot->getGlobalBounds().width*i, 572.f);
		

	}
	spriteLose->setTexture(*texLose);
	spriteWin->setTexture(*texWin);
	spriteCuadro->setTexture(*texCuadro);

	spriteLose->setPosition(250.f, 200.f);
	spriteLose->setScale(0.7f, 0.7f);
	spriteWin->setPosition(250.f, 200.f);
	spriteWin->setScale(0.7f, 0.7f);
	spriteCuadro->setPosition(290.f, 300.f);
	spriteCuadro->setScale(0.7f, 0.7f);
}

void GameUI::updateHP(int hp)
{
	HitPoints = hp;
}

void GameUI::updateScore(int score)
{
	TotalScore = score;
	textPoints->setString("PUNTUACION:\n" + std::to_string(TotalScore));
}

void GameUI::updateLives(int lives)
{
	TotalLives = lives;
	textLives->setString("VIDAS:\t" + std::to_string(TotalLives));
	
}

void GameUI::updateSpecialCharges(int charges)
{
	specialCounter = charges;
}

void GameUI::finDeJuego(bool victoria)
{
	if (victoria) {
		victory = true;
		textPoints->setPosition(350.f, 315.f);
		textPoints->setScale(1.3f, 1.3f);
	}
	else {
		defeat = true;
		textPoints->setPosition(350.f, 315.f);
		textPoints->setScale(1.3f, 1.3f);
	}

}

void GameUI::draw(sf::RenderTarget& target, sf::RenderStates states) const
{
	if (!defeat && !victory) {
		target.draw(*spriteMainBar, states);
		target.draw(*spriteHPBar, states);
		target.draw(*spriteSpecialBar);
		target.draw(*textPoints, states);
		target.draw(*textLives, states);
		target.draw(*textPlayerName, states);

		for (int i = 0;i < HitPoints;i++) {
			target.draw(spriteHPDot[i]);

		}
		for (int i = 0;i < specialCounter;i++) {
			target.draw(spriteSpecialDot[i]);

		}
	}

	if (victory) {
		target.draw(*spriteCuadro, states);
		target.draw(*spriteWin, states);
		target.draw(*textPoints, states);
		target.draw(*textReturn, states);

	}
	if (defeat) {
		target.draw(*spriteCuadro, states);
		target.draw(*spriteLose, states);
		target.draw(*textPoints, states);
		target.draw(*textReturn, states);
	}

}
