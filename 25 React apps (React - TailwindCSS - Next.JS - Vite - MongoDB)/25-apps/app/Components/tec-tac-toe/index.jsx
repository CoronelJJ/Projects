"use client";
import { useEffect, useState } from "react";
import "./styles.css";

export default function TicTacToe() {
  const [tiles, setTiles] = useState(Array(9).fill(""));
  const [isXTurn, setIsXTurn] = useState(true);
  const [winner, setWinner] = useState("");

  function Tile({ value, onclick }) {
    return (
      <button className="tile" onClick={onclick}>
        {value}
      </button>
    );
  }

  function handleClick(getTile) {
    let copyTiles = [...tiles];
    if (getWinner(copyTiles)) return;
    if (copyTiles[getTile] === "") {
      copyTiles[getTile] = isXTurn ? "X" : "O";
      setIsXTurn(!isXTurn);
      setTiles(copyTiles);
    }
  }

  function getWinner(tiles) {
    const winingPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2],
    ];

    for (let i = 0; i < winingPatterns.length; i++) {
      const [x, y, z] = winingPatterns[i];

      if (tiles[x] && tiles[x] === tiles[y] && tiles[x] === tiles[z]) {
        return tiles[x];
      }
    }
    return null;
  }

  function handleRestart(){
    setIsXTurn(true);
    setTiles(Array(9).fill(''));
  }

  useEffect(() => {
    if (!getWinner(tiles) && tiles.every((item) => item !== "")) {
      setWinner("This is draw please restart");
    } else if (getWinner(tiles)) {
      setWinner(`The winner is: ${getWinner(tiles)}`);
    } else {
      setWinner(`Next turn is: ${isXTurn ? "X" : "O"}`);
    }
  }, [tiles, isXTurn]);

  return (
    <div className="tic-tac-toe-container">
      <div className="row">
        <Tile value={tiles[0]} onclick={() => handleClick(0)} />
        <Tile value={tiles[1]} onclick={() => handleClick(1)} />
        <Tile value={tiles[2]} onclick={() => handleClick(2)} />
      </div>
      <div className="row">
        <Tile value={tiles[3]} onclick={() => handleClick(3)} />
        <Tile value={tiles[4]} onclick={() => handleClick(4)} />
        <Tile value={tiles[5]} onclick={() => handleClick(5)} />
      </div>
      <div className="row">
        <Tile value={tiles[6]} onclick={() => handleClick(6)} />
        <Tile value={tiles[7]} onclick={() => handleClick(7)} />
        <Tile value={tiles[8]} onclick={() => handleClick(8)} />
      </div>
      <h2>{winner}</h2>
      <button onClick={handleRestart}>Restart</button>
    </div>
  );
}
