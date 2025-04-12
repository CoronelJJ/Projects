"use client";
import RecipeItem from "@/components/recipe-item";
import { GlobalContext, useGlobalContext } from "@/context";
import { useContext ,useEffect, useState} from "react";

export default function Home() {
 const { loading, recipeList } = useGlobalContext();

 

  if (loading) return <div>Loading please wait</div>;

  return (
    <div className="py-8 container mx-auto flex flex-wrap justify-center gap-10">
      {recipeList && recipeList.length ? (
        recipeList.map((item) => <RecipeItem key={item?.id} item={item} />)
      ) : (
        <p className="lg:text-4xl text-1xl text-center text-black font-extrabold">
          No results, search something else
        </p>
      )}
    </div>
  );
}
