Array.prototype.bubbleSort = function () {
    // debugger;
    var sorted = false;

    while (!sorted) {
        sorted = true;

        for(let i = 0; i < this.length; i++) {

            if (this[i] > this[i + 1]) {
                [this[i], this[i + 1]] = [this[i + 1], this[i]];
                sorted = false;
            }
        }
    }

    return this;
}

String.prototype.substrings = function () { //cats -> []
    let strThings = []
    // debugger;
    for(let i = 0; i < this.length; i++) {
        for(let j = (i + 1); j <= this.length; j++) {
            strThings.push(this.slice(i, j));
        }
    }

    return strThings;
}