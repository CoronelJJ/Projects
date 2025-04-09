

function updateClock(){

    const current = new Date();
    const hours = current.getHours().toString().padStart(2,0);
    const minutes = current.getMinutes().toString().padStart(2,0);
    const seconds = current.getSeconds().toString().padStart(2,0);

    const timeString = `${hours}:${minutes}:${seconds}`;
    document.getElementById("clock").textContent = timeString;
}

function updateClock2(){

    const current = new Date();
    let hours = current.getHours();
    const meridiem = hours >= 12? "PM" : "AM";
    hours = hours % 12 || 12;
    hours = hours.toString().padStart(2,0);
    const minutes = current.getMinutes().toString().padStart(2,0);
    const seconds = current.getSeconds().toString().padStart(2,0);

    const timeString = `${hours}:${minutes}:${seconds} ${meridiem}`;
    document.getElementById("clock").textContent = timeString;
}

updateClock2();
setInterval(updateClock2,1000);






