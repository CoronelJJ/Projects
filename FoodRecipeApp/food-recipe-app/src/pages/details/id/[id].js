import RecipeDetails from "@/components/recipe-details";
import GlobalState from "@/context";
import { useRouter } from "next/router";



export default function Details() {
  
  const router = useRouter();
  const { id } = router.query;
  

  return (
    <GlobalState>
      <div>
        <RecipeDetails id={id} />
      </div>
    </GlobalState>
  );
}
