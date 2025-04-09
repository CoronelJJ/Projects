
const display = document.getElementById("display");
let previousIsNaN = true;

function appendToDisplay(input){
    if (isNaN(input)){
        if(!previousIsNaN){
            previousIsNaN = true;
            display.value += input;
        }
    }
    else {
        previousIsNaN=false;
        display.value += input;
    }

}

function calculate(){
    try{
        display.value =eval(display.value);
    }
    catch(error){
        display.value = "ERROR";
    }

}

function clearDisplay(){
    display.value = "";
}