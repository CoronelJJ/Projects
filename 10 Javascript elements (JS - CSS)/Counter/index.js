const btnIncrease = document.getElementById("btnIncrease");
const btnDecrease = document.getElementById("btnDecrease");
const btnReset = document.getElementById("btnReset");
const countLabel = document.getElementById("countLabel");


let countValue = 0;

function changeLabel(){
    countLabel.textContent = countValue;
}

btnIncrease.onclick = function(){
    countValue++;
    changeLabel();
    //document.getElementById("countLabel").textContent = countValue;
}

btnDecrease.onclick = function(){
    countValue--;
    changeLabel();
}

btnReset.onclick = function(){
    countValue = 0;
    changeLabel();
}