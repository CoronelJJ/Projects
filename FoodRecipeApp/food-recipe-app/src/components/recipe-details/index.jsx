"use client";
import { useContext, useEffect } from "react";
import { GlobalContext, useGlobalContext } from "@/context";

export default function RecipeDetails({ id }) {
  const { recipeDetailsData, setRecipeDetailsData, handleAddToFavorite } = useGlobalContext();

  useEffect(() => {
    async function getRecipeDetails() {
      try {
        const response = await fetch(
          `https://forkify-api.herokuapp.com/api/v2/recipes/${id}`
        );

        const data = await response.json();
        if (data?.data) {
          setRecipeDetailsData(data?.data);

          console.log(data);
        }
      } catch (error) {
        console.log(error);
      }
    }
    getRecipeDetails();
  }, [id]);

  console.log(id);

  return (
    <div className="container mx-auto py-10 grid grid-cols-1 lg:grid-cols-2 gap-10">
      <div className="row-start-2 lg:row-start-auto">
        <div className="h-96 overflow-hidden rounded-xl group">
          <img
            src={recipeDetailsData?.recipe?.image_url}
            alt="recipe image"
            className="w-full h-full object-cover block group-hover:scale-105 duration-300"
          />
        </div>
      </div>
      <div className="flex flex-col gap-3">
        <span className="text-sm text-teal-400 font-medium">
          {recipeDetailsData?.recipe?.publisher}
        </span>
        <h3 className="font-bold text-2xl truncate text-black">
          {recipeDetailsData?.recipe?.title}
        </h3>
        <button onClick={()=> handleAddToFavorite(recipeDetailsData?.recipe)} className="p-3 px-8 rounded-lg text-sm uppercase font-medium tracking-wider mt-3 inline-block shadow-md bg-black text-white">
          Save as favorite
        </button>
      </div>
      <div>
        <span className="text-2xl font-semibold text-black">Ingredients:</span>
        <ul className="flex flex-col gap-3">
          {recipeDetailsData?.recipe?.ingredients.map((ing) => (
            <li>
              <span className="font-bold text-2xl truncate text-black">
                {ing.quantity} {ing.unit}
              </span>
              <span className="font-bold text-2xl truncate text-black">
                {ing.description}
              </span>
            </li>
          ))}
        </ul>
      </div>
    </div>
  );
}
