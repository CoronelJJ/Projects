
const tempInput = document.getElementById("tempInput");
const toFahrenheit = document.getElementById("toFahrenheit");
const toCelsius = document.getElementById("toCelcius");
const result = document.getElementById("result");

let temp;

function convert(){
    temp= Number(tempInput.value);

    if(toFahrenheit.checked){
       temp = temp * 9 / 5 + 32;
       result.textContent = temp.toFixed(1) + "ºF";
    }
    else if (toCelsius.checked){    
        temp = (5 / 9) * (temp - 32);
       result.textContent = temp.toFixed(1) + "ºC";
    }
    else{
        result.textContent = "Select a unit";
    }
}