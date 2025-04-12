"use client";
import { useDebugValue, useEffect, useState } from "react";
import "./styles.css";

export default function RandomColor() {
  const [colorType, setColorType] = useState("HEX");
  const [color, setColor] = useState("#000000");

  function randomColorUtility(max) {
    return Math.floor(Math.random() * max);
  }
  function handleGetRandomHexColor() {
    const hexValues = [
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      "A",
      "B",
      "C",
      "D",
      "E",
      "F",
    ];
    let hexColor = "#";

    for (let i = 0; i < 6; i++) {
      hexColor += hexValues[randomColorUtility(hexValues.length)];
    }
    setColor(hexColor);
  }

  function handleGetRandomRgbColor() {
    const rgbColor = `rgb(${randomColorUtility(256)},
    ${randomColorUtility(256)},
    ${randomColorUtility(256)})`;

    setColor(rgbColor);
  }

  useEffect(() => {
    if (color === "HEX") {
      handleGetRandomHexColor();
    } else {
      handleGetRandomRgbColor();
    }
  }, [colorType]);

  return (
    <div
      className="random-color-container"
      style={{
        height: "100vh",
        width: "100vw",
        backgroundColor: color,
        alignItems: "center",
      }}
    >
      <button onClick={() => setColorType("HEX")}>Hex Color</button>
      <button onClick={() => setColorType("RGB")}>RGB Color</button>
      <button
        onClick={
          colorType === "HEX"
            ? handleGetRandomHexColor
            : handleGetRandomRgbColor
        }
      >
        Get random color
      </button>
      <div
        style={{
          display: "flex",
          justifyContent: "center",
          flexDirection: "column",
          alignItems: "center",
          fontSize: "2.5rem",
          marginTop: "50px",
          color: "white",
          textShadow: "2px 2px black",
        }}
      >
        <h2>{colorType}</h2>
        <h3>{color}</h3>
      </div>
    </div>
  );
}
