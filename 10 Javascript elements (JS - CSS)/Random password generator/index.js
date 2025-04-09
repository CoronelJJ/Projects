
function generatePassword(lenght, includeLowerCase, includeUpperCase, includeNumber, includeSymbol){

    const lowerCaseChars = "abcdefghijklmnopqrstuvwxyz";
    const upperCaseChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const numberChars = "0123456789";
    const symbolChars = "+-/*()$%@";

    let allowedChars = "";
    let password = "";

    allowedChars += includeLowerCase ? lowerCaseChars : "";
    allowedChars += includeUpperCase ? upperCaseChars : "";
    allowedChars += includeNumber ? numberChars : "";
    allowedChars += includeSymbol ? symbolChars : "";

    if (lenght <= 0){
        console.log("Password lenght must be at least 1 ");
    }

    if (allowedChars.length === 0){
        console.log("select 1 set of characters at minimum");
    }


    for (let i = 0; i < lenght; i++){
        const randomIndex = Math.floor(Math.random() * allowedChars.length);
        password += allowedChars.charAt(randomIndex);
    }

    return password;
}


const passswordLenght = 12;
const includeLowerCase = true;
const includeUpperCase = true;
const includeNumber = true;
const includeSymbol = true;

const password = generatePassword(passswordLenght,includeLowerCase,includeUpperCase,includeNumber,includeSymbol);


console.log(`Generated password: ${password} `);
