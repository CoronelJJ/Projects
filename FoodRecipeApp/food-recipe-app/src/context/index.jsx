"use client";
import { createContext, useContext, useState } from "react";

export const GlobalContext = createContext(null);

export default function GlobalState({ children }) {
  const [searchParam, setSearchParam] = useState("");
  const [loading, setLoading] = useState(false);
  const [recipeList, setRecipeList] = useState([]);
  const [recipeDetailsData, setRecipeDetailsData] = useState([]);
  const [favoriteList, setFavoriteList] = useState([]);

  async function handleSubmit(event) {
    event.preventDefault();

    try {
      setLoading(true);
      const res = await fetch(
        `https://forkify-api.herokuapp.com/api/v2/recipes?search=${searchParam}`
      );

      const data = await res.json();

      if (data?.data?.recipes) {
        setRecipeList(data?.data?.recipes);
        setLoading(false);
        setSearchParam("");
      }
    } catch (error) {
      console.log(error);
      setLoading(false);
      setSearchParam("");
    }
  }
  
  function handleAddToFavorite(getCurrentItem){
    
    console.log(getCurrentItem);
    let copyFavoriteList= [...favoriteList];
    const index = copyFavoriteList.findIndex(item=> item.id === getCurrentItem.id);

    if (index === -1){
      copyFavoriteList.push(getCurrentItem);
    }
    else{
      copyFavoriteList.splice(index);
    }
    console.log(copyFavoriteList, "copy");
    setFavoriteList(copyFavoriteList);
    console.log(favoriteList, "list");

  }

  return (
    <GlobalContext.Provider
      value={{
        searchParam,
        loading,
        recipeList,
        recipeDetailsData,
        favoriteList,
        setSearchParam,
        handleSubmit,
        setRecipeDetailsData,
        handleAddToFavorite
      }}
    >
      {children}
    </GlobalContext.Provider>
  );
}

export const useGlobalContext = () => useContext(GlobalContext);
