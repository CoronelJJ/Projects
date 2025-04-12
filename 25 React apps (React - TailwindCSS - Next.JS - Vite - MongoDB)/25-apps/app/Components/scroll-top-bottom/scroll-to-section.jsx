"use client";

import { useRef } from "react";

export default function ScrollToSection() {
  
  const cardRef = useRef(null);
    const data = [
    {
      label: "first card",
      style: {
        width: "100%",
        height: "600px",
        background: "red",
      },
    },
    {
      label: "second card",
      style: {
        width: "100%",
        height: "600px",
        background: "green",
      },
    },
    {
      label: "third card",
      style: {
        width: "100%",
        height: "600px",
        background: "blue",
      },
    },
    {
      label: "fourth card",
      style: {
        width: "100%",
        height: "600px",
        background: "tomato",
      },
    },
    {
      label: "fifth card",
      style: {
        width: "100%",
        height: "600px",
        background: "magenta",
      },
    },
  ];

  function handleScrollToSection(){
    if (cardRef !== null) {
        let pos = cardRef.current.getBoundingClientRect().top;

        window.scrollTo({
            top: pos,
            behavior: 'smooth',
        })
    }
  }

  return (
    <div>
      <h1>Scroll to a particular section</h1>
      <button onClick={handleScrollToSection}>Click to scroll</button>
      {data.map((card, index) => (
        <div ref={index === 2? cardRef : null} style={card.style} key={card.label}>
          <h3>{card.label}</h3>
        </div>
      ))}
    </div>
  );
}
