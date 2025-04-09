
/*
fetch("https://pokeapi.co/api/v2/pokemon/kadabra",)
    .then(response => {

        if(!response.ok){
            throw new Error("Error fetching data");
        };
        return response.json();


    })
    .then(data => console.log(data.name))
    .catch(error => console.error(error));

*/


async function fetchData() {
    
    try{
        const pokemonName = document.getElementById("pokemonName").value.toLowerCase();

        const response = await fetch(`https://pokeapi.co/api/v2/pokemon/${pokemonName}`);

        if(!response.ok){
            throw new Error("Error fetching data");
        }

        const data = await response.json();
        console.log(data);

        const pokemonDataSprite = data.sprites.front_default;
        const pokemonSprite = document.getElementById("pokemonSprite");
        pokemonSprite.src = pokemonDataSprite;
        pokemonSprite.style.display = "block";
    }
    catch(error){
        console.error(error);
    }
}