Array.prototype.uniq = function () {
     let uniqs = [];

     for (let i = 0; i < this.length; i++) {
        if (uniqs.indexOf(this[i]) === -1) {
            // if (!uniqs.include(this[i]))
            uniqs.push(this[i]);
        }
     }
    return uniqs;
 };

Array.prototype.twoSum = function () {
    let arr = [];

    for (let i = 0; i < this.length; i++) {
        for (let j = 0; j < this.length; j++) {
            if (this[i] + this[j] === 0) {
                arr.push([i, j]);
            }
        }
    }
    return arr;
};

Array.prototype.transpose = function () {
    const transArr = Array.from({length: this[0].length}, () => Array.from({length: this.length}));

    for (let i = 0; i < this.length; i++) {
        for (let j = 0; j < this[i].length; j++) {
            transArr[j][i] = this[i][j];
        }
    }
return transArr
};