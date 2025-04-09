

function rollDice(){
    const numberOfDices = document.getElementById("numberOfDices").value;
    const diceResult = document.getElementById("diceResult");
    const diceImages = document.getElementById("diceImages");
    const values = [];
    const images = [];

    for(let i = 0; i < numberOfDices; i++){
        const value = Math.trunc(Math.random() * 6) + 1;
        values.push(value);
        images.push(`<img src="dice faces/${value}.png" alt= "Dice ${value}">`);
    }

    diceResult.textContent = `Rolls: ${values.join(", ")}`;
    diceImages.innerHTML = images.join("");

    console.log(values);
}