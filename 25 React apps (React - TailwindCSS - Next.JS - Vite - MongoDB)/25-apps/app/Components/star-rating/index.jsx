"use client";
import { useState } from "react";
import { FaStar } from "react-icons/fa";
import "./styles.css";

export default function StarRating({ maxStars = 5 }) {
  const [rating, setRating] = useState(0);
  const [hover, setHover] = useState(0);

  function handleClick(currentIndex) {
    setRating(currentIndex);
  }

  function handleHover(currentIndex) {
    setHover(currentIndex);
  }

  function handleLeave() {
    setHover(rating);
  }

  return (
    <div className="star-rating">
      {[...Array(maxStars)].map((_value, index) => {
        index += 1;
        return (
          <FaStar
            key={index}
            className={index <= (hover || rating) ? "active" : "inactive"}
            onClick={() => handleClick(index)}
            onMouseMove={() => handleHover(index)}
            onMouseLeave={() => handleLeave()}
            size={40}
          />
        );
      })}
    </div>
  );
}
