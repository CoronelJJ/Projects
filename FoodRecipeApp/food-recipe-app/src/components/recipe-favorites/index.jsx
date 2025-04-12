"use client";
import RecipeItem from "@/components/recipe-item";
import GlobalState, { GlobalContext, useGlobalContext } from "@/context";
import { useContext, useEffect, useState } from "react";

export default function RecipeFavorites({list}) {
  const { favoriteList } = useGlobalContext();

  console.log(favoriteList, "favorite list");

  
  return (
    <div className="py-8 container mx-auto flex flex-wrap justify-center gap-10">
      {favoriteList && favoriteList.length > 0 ? (
        favoriteList.map((item) => <RecipeItem key={item?.id} item={item} />)
      ) : (
        <p className="lg:text-4xl text-1xl text-center text-black font-extrabold">
          Nothing in favorites
        </p>
      )}
    </div>
  );
}
