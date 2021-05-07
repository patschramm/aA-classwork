const readline = require("readline");

const reader = readline.createInterface(process.stdin, process.stdout);

function addNumbers(sum = 0, numsLeft, completionCallback) {
    if (numsLeft > 0) {
        reader.question('Give me a number ', function (response) {
            let num = parseInt(response);
            sum += num;
            console.log(sum);
            addNumbers(sum, numsLeft - 1, completionCallback);
        })
    } else {
        completionCallback(sum);
    }

}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));