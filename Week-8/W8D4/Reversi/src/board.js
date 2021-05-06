// DON'T TOUCH THIS CODE
if (typeof window === "undefined") {
  var Piece = require("./piece");
}
// DON'T TOUCH THIS CODE

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid() {
  let grid = new Array(8);

  for (let i = 0; i < grid.length; i++) {
    grid[i] = new Array(8);
  }

  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board() {
  this.grid = _makeGrid();
  this.grid[3][3] = new Piece("white");
  this.grid[4][4] = new Piece("white");
  this.grid[3][4] = new Piece("black");
  this.grid[4][3] = new Piece("black");
}

Board.DIRS = [
  [0, 1],
  [1, 1],
  [1, 0],
  [1, -1],
  [0, -1],
  [-1, -1],
  [-1, 0],
  [-1, 1],
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  return pos[0] >= 0 && pos[0] < 8 && pos[1] >= 0 && pos[1] < 8;
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (this.isValidPos(pos)) {
    return this.grid[pos[0]][pos[1]];
  } else {
    throw new Error("Not valid pos!");
  }
};
/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  let piece = this.getPiece(pos);
  return piece && piece.color === color;
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  return this.getPiece(pos) !== undefined;
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
function addPosition(pos, dir) {
  return [dir[0] + pos[0], dir[1] + pos[1]];
}

Board.prototype._positionsToFlip = function (pos, color, dir, piecesToFlip) {
  piecesToFlip = piecesToFlip || [];
  let nextPos = addPosition(pos, dir);

  if (!this.isValidPos(nextPos) || !this.isOccupied(nextPos)) {
    return [];
  }

  if (this.isMine(nextPos, color)) {
    return piecesToFlip;
  }

  piecesToFlip.push(nextPos);

  return this._positionsToFlip(nextPos, color, dir, piecesToFlip);
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (this.isOccupied(pos)) {
    return false;
  }
  for (let i = 0; i < Board.DIRS.length; i++) {
    if (this._positionsToFlip(pos, color, Board.DIRS[i]).length > 0) {
      return true;
    }
  }
  return false;
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (!this.validMove(pos, color)) {
    throw new Error("Invalid move!");
  }
  let arr = [];
  for (let i = 0; i < Board.DIRS.length; i++) {
    arr = arr.concat(this._positionsToFlip(pos, color, Board.DIRS[i]));
  }
  for (let j = 0; j < arr.length; j++) {
    this.getPiece(arr[j]).flip();
  }
  this.grid[pos[0]][pos[1]] = new Piece(color);
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let arr = [];
  for (let i = 0; i < this.grid.length; i++) {
    // let row = this.grid[i].length;
    for (let j = 0; j < this.grid.length; j++) {
      if (this.validMove([i, j], color)) {
        arr.push([i, j]);
      }
    }
  }
  return arr;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  return this.validMoves(color).length > 0;
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  return (!this.hasMove("black") && !this.hasMove("white"))
};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {

  for(let i = 0; i < this.grid.length; i++) {
    let row = "";

    for(let j = 0; j < this.grid.length; j++){

      if (this.getPiece([i, j]) != undefined) {
        row += ' ' + this.getPiece([i, j]).toString() + ' ';
      } else {
        row += ' _ ';
      }
    }

    console.log(row);
  }
};

// DON'T TOUCH THIS CODE
if (typeof window === "undefined") {
  module.exports = Board;
}
// DON'T TOUCH THIS CODE
