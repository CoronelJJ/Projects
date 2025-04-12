
import RecipeFavorites from "@/components/recipe-favorites";
import GlobalState, { useGlobalContext } from "@/context";
import { useContext } from "react";


export default function Favorites() {
  

  return (
    <GlobalState>
      <div>
        
        <RecipeFavorites/>
      </div>
    </GlobalState>
  );
}