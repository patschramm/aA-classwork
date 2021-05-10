// const sum = (...args) => {
//     const arr = Array.from(args);

//     return arr.reduce((acc, el) => acc + el);
// }

// const sum = function () {
//     const arr = Array.from(arguments);

//     return arr.reduce((acc, el) => acc + el);
// }

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);

// Function.prototype.myBind = function () {
//     const that = this;
//     const obj = arguments[0];
//     const args = Array.from(arguments).slice(1);

//     return function () {
//         that.apply(obj, args.concat(Array.from(arguments)));
//         return true;
//     }
// }

Function.prototype.myBind = function(obj, ...args) {
    return (...callArgs) => this.apply(obj, args.concat(callArgs));
}

class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

// console.log(markov.says("meow", "Ned"));
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args
// console.log(markov.says.myBind(pavlov, "meow", "Kush")());
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// console.log(markov.says.myBind(pavlov)("meow", "a tree"));
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// console.log(markov.says.myBind(pavlov, "meow")("Markov"));
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// // Pavlov says meow to me!
// // true

function curriedSum(numArgs) {
    let numbers = [];
    function _curriedSum(num){
        numbers.push(num);
        if (numbers.length === numArgs) {
            let sum = 0;
            for(let i = 0; i < numbers.length; i++){
                sum += numbers[i];
            }
            return sum;
        }else{
            return _curriedSum;
        }
    }
    return _curriedSum;
}


const sum = curriedSum(4);
console.log(sum(5)(30)(20)(1)); // => 56