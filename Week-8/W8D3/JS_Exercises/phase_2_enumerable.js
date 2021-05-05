Array.prototype.myEach = function (fatArrow) {

    for (let i = 0; i < this.length; i++) {
        fatArrow(this[i]); 
    }

};

Array.prototype.myMap = function (rubenesqueArrow) {
 let skinnyArr = [];

    this.myEach(el => skinnyArr.push(rubenesqueArrow(el))); 
    return skinnyArr;
};

Array.prototype.myReduce = function (fatBoy, initialValue) {
    let huskyArr = this; 

        if (initialValue === undefined) {
            initialValue = huskyArr[0];
            huskyArr = huskyArr.slice(1);  
        } 
   huskyArr.myEach(el => initialValue = fatBoy(initialValue, el));
   return initialValue;
};