"use client";

import { GlobalContext } from "@/context";
import RecipeDetails from "@/pages/details/id/[id]";
import RecipeFavorites from "@/components/recipe-favorites";

import Link from "next/link";
import { useContext } from "react";

export default function NavBar() {
  
  const {searchParam, setSearchParam,handleSubmit} = useContext(GlobalContext);
 
  
 
  return (
    <nav className="flex justify-between items-center py-8 container mx-auto flex-col lg:flex-row gap-5 lg:gap-0">
      <Link href="/">
      <h2 className="text-2xl font-semibold">Food recipe</h2>

      </Link>
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          name="search"
          value={searchParam}
          onChange={(event)=> setSearchParam(event.target.value)}
          placeholder="enter items"
          className="bg-white p-3 px-8 rounded-full outline-none lg:w-96 shadow-lg shadow-red-100 focus:shadow-red-200"
        />
      </form>

      <ul className="flex gap-5">
        <li>
          <Link href="/" className="text-black hover:text-gray-700 duration-300">
            HOME
          </Link>
        </li>
        <li>
          <Link href="/favorites/page" className="text-black hover:text-gray-700 duration-300">
            Favorites
          </Link>
        </li>
      </ul>

     
      
    </nav>
  );
}


/*<Link href="/details/45">
        <RecipeDetails />
      </Link>*/