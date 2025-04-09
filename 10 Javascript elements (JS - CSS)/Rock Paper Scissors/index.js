

const choices = ["rock","paper","scissors"];
const playerDisplay = document.getElementById("playerDisplay");
const computerDisplay = document.getElementById("computerDisplay");
const resultDisplay = document.getElementById("resultDisplay");
const playerScoreDisplay = document.getElementById("playerScoreDisplay");
const computerScoreDisplay = document.getElementById("computerScoreDisplay");

let playerScore = 0;
let computerScore = 0;

function playGame(playerChoice){
    const computerChoice = choices[Math.floor(Math.random() * 3)];
    let result = "";
    playerDisplay.textContent = "PLAYER:";
    computerDisplay.textContent = "COMPUTER:";

    if(playerChoice === computerChoice){
        result = "IT'S A TIE";
    }
    else{
        switch(playerChoice){
            case "rock":
                if (computerChoice === "scissors"){
                    result = "YOU WIN";
                }
                else{
                    result= "YOU LOSE";
                }
                break;
            case "paper":
                if (computerChoice === "rock"){
                    result = "YOU WIN";
                }
                else{
                    result= "YOU LOSE";
                }
                break;
            case "scissors":
                if (computerChoice === "paper"){
                    result = "YOU WIN";
                }
                else{
                    result= "YOU LOSE";
                }
                break;
        }
        
    }

    switch(result){
        case "IT'S A TIE":
            resultDisplay.style.backgroundColor = "white";
            resultDisplay.style.color = "black";
        break;
        case "YOU WIN":
            resultDisplay.style.backgroundColor = "green";
            resultDisplay.style.color = "white";
            playerScore++;
            playerScoreDisplay.textContent = playerScore;
        break;
        case "YOU LOSE":
            resultDisplay.style.backgroundColor = "red";
            resultDisplay.style.color = "yellow";
            computerScore++;
            computerScoreDisplay.textContent = computerScore;
        break;

    }
    console.log(result);
    playerDisplay.textContent += playerChoice;
    computerDisplay.textContent += computerChoice;
    resultDisplay.textContent = result;
    
}
