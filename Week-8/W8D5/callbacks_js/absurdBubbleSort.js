const readline = require("readline");

const reader = readline.createInterface(process.stdin, process.stdout);


function askIfGreaterThan(el1, el2, callback) {
    reader.question(`Is ${el1} greater than ${el2} `, function(response) {
        if (response === 'yes') {
            callback(true);
        } else {
            callback(false);
        }
    })
};

askIfGreaterThan(1, 10);