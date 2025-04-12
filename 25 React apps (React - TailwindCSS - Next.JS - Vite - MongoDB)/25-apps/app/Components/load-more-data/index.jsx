"use client";
import { useEffect, useState } from "react";
import "./styles.css";

export default function LoadMoreData() {
  const [loading, setLoading] = useState(false);
  const [products, setProducts] = useState([]);
  const [count, setCount] = useState(0);
  const [disableButton, setDisableButton] = useState(false);

  async function fecthProducts() {
    try {
      setLoading(true);
      const response = await fetch(
        `https://dummyjson.com/products?limit=20&skip=${
          count === 0 ? 0 : count * 20
        }`
      );

      const result = await response.json();

      if (result && result.products && result.products.length) {
        setProducts(p => [...p, ...result.products]);
        setLoading(false);
      }

      console.log(result);
    } catch (error) {
      console.log(error);
      setLoading(false);
    }
  }

  useEffect(() => {
    fecthProducts();
  }, [count]);

  useEffect(() => {
    if (products && products.length === 100) setDisableButton(true);
  },[products])

  if (loading) {
    return <div>Loading data please wait</div>;
  }

  return (
    <div className="more-data-container">
      <div className="product-container">
        {products && products.length
          ? products.map((item) => (
              <div key={item.id}>
                <img
                  className="product"
                  src={item.thumbnail}
                  alt={item.title}
                />
                <p>{item.title}</p>
              </div>
            ))
          : null}
      </div>
      <div className="load-button-container">
        <button disabled={disableButton} onClick={()=> setCount(count + 1)}>Load more products</button>
        
            {
                disableButton ? <p>You cant load more than 100 products</p> : null   
            }
        
      </div>
    </div>
  );
}
