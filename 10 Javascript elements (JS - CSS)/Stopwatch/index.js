
const display = document.getElementById("display");
const container = document.getElementById("container");
let timer = null;
let startTime = 0;
let elapsedTime = 0;
let isRunning = false;

function start(){

    if(!isRunning){
        startTime = Date.now() - elapsedTime;
        timer = setInterval(update,10);
        isRunning = true;
        display.style.color= "hsla(120, 88%, 44%, 0.85)";
        container.style.borderColor = "hsla(120, 88%, 44%, 0.85)";
    }
}

function stop(){

    if(isRunning){
        clearInterval(timer);
        elapsedTime = Date.now() - startTime;
        isRunning = false;
        display.style.color = "hsla(0, 86%, 53%, 0.85)";
        container.style.borderColor = "hsla(0, 86%, 53%, 0.85)";
    }
}

function reset(){
    clearInterval(timer);
    startTime = 0;
    elapsedTime = 0;
    isRunning = false;
    display.textContent = "00:00:00:00";
    display.style.color = "hsla(180, 84%, 66%, 0.74)";
    container.style.borderColor = "hsla(180, 84%, 66%, 0.74)";

}

function update(){
    const currentTime = Date.now();
    elapsedTime = currentTime - startTime;

    let hours = Math.floor(elapsedTime / (1000 * 60 * 60));
    let minutes = Math.floor(elapsedTime / (1000 * 60) % 60);
    let seconds = Math.floor(elapsedTime / 1000  % 60);
    let miliseconds = Math.floor(elapsedTime % 1000 / 10);

    hours = hours.toString().padStart(2,0);
    minutes = minutes.toString().padStart(2,0);
    seconds = seconds.toString().padStart(2,0);
    miliseconds = miliseconds.toString().padStart(2,0);


    display.textContent = `${hours}:${minutes}:${seconds}:${miliseconds}`

}