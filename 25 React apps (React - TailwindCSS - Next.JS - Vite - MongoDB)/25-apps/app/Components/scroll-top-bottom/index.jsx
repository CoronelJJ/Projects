"use client";
import { useRef, useState } from "react";
import useFetch from "../use-fetch";

export default function ScrollTopBottom() {
  const { data, error, pending } = useFetch(
    "https://dummyjson.com/products?limit=100",
    {}
  );

  const bottomRef = useRef(null);

  function handleScrollToTop() {
    window.scrollTo({
      top: 0,
      left: 0,
      behavior: "smooth",
    });
  }

  function handleScrollToBottom() {
    bottomRef.current.scrollIntoView({ behavior: "smooth" });
  }

  if (error) return <h1>And error has occured, try again</h1>;
  if (pending) return <h3>Loading please wait</h3>;

  return (
    <div>
      <h1>Scroll to top and bottom feature</h1>
      <h3>This is the top</h3>
      <button onClick={handleScrollToBottom}>Scroll to bottom</button>
      <ul>
        {data && data.products && data.products.length
          ? data.products.map((product) => (
              <li key={product.id}>{product.title}</li>
            ))
          : null}
      </ul>
      <button onClick={handleScrollToTop}>Scroll to top</button>
      <div ref={bottomRef}></div>
      <h3>This is the bottom</h3>
    </div>
  );
}
