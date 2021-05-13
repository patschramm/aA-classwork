// function Surrogate(){}

// Surrogate.prototype = SuperClass.prototype;
// SubClass.prototype = new Surrogate();

// SubClass.prototype.constructor = SubClass;

Function.prototype.inherits = function(parentClass) {
  function Surrogate() {}
  Surrogate.prototype = parentClass.prototype;

  this.prototype = new Surrogate();
  this.prototype.constructor = this;
}

function MovingObject() {}

MovingObject.prototype.log = function (){
  console.log("yep");
}

function Ship() {}

Ship.inherits(MovingObject);

let s = new Ship();
console.log(s.name)

















// function Surrogate () {}
// Surrogate.prototype = MovingObject.prototype;

// function Ship() { }
// Ship.prototype = new Surrogate();
// Ship.prototype.constructor = Ship;
// let s = new Ship();
// s.log();

// // Ship.inherits(MovingObject);


