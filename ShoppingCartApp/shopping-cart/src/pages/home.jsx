import { useEffect, useState } from "react";
import ProductTile from "../components/product-tile";

export default function Home() {
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(false);

  async function fetchListOfProducts(params) {
    try {
      setLoading(true);
      const response = await fetch("https://fakestoreapi.com/products");
      const data = await response.json();

      if (data) {
        setLoading(false);
        setProducts(data);
      }
    } catch (error) {
      console.log(error);
      setLoading(false);
    }
  }

  useEffect(() => {
    fetchListOfProducts();
  }, []);

  return (
    <div>
      {loading ? (
        <div>Loading data please wait</div>
      ) : (
        <div className="min-h-[80vh] grid sm:grid-cols-2 md:grid-cols-3 space-x-5 space-y-10 lg:grid-cols-4 max-w-6xl mx-auto p-3">
          {products && products.length
            ? products.map((item) => <ProductTile product={item} />)
            : null}
        </div>
      )}
    </div>
  );
}
