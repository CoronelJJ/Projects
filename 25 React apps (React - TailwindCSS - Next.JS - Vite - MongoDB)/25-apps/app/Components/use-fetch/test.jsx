"use client";

import { BsTypeH3 } from "react-icons/bs";
import useFetch from ".";

export default function UseFetchHookTest() {
  const { data, error, pending } = useFetch(
    "https://dummyjson.com/products",
    {}
  );

  console.log(data, error, pending);
  return (
    <div>
      <h1>Use fetch hook</h1>
      {pending ? "Pending plase wait" : null}
      {error? <h3>{error}</h3>: null}
      {data && data.products && data.products.length
        ? data.products.map((product) => <p key={product.id}>{product.title}</p>)
        : null}
    </div>
  );
}
