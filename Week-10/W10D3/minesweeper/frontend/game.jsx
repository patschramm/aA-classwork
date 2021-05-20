import React from "react";
import Board from "./board.jsx"
import * as Minesweeper from "../minesweeper.js";

class Game extends React.Component {
    constructor(props) {
        super(props);
        this.state = {board: new Minesweeper.Board(9,5)};
        this.updateGame = this.updateGame.bind(this);
    }

    restartGame() {
        let board = new Minesweeper.Board(9,5)
        this.setState({board: board});
    }

    updateGame(tile, flag) {
        if (flag) {
            tile.toggleFlag();
        } else {
            tile.explore();
        }
        this.setState({board: this.state.board})
    }

    render() { 
        let text;
        let over = ["modal", "screen"]
        if (this.state.board.won()) {
            text = "Congratulations, you won!!!";
            over = ["modal-over", "screen-over"];
        };

        if (this.state.board.lost()) {
            text = "You lost!";
            over = ["modal-over", "screen-over"];
        };

        return ( 
            <div>
                <div>
                    <Board board={this.state.board} updateGame={this.updateGame} />
                </div>
                <div className={over[0]}>
                    <p>{text}</p>
                    <button onClick={this.restartGame}>Restart Game</button>
                </div>
                <div className={over[1]}>
                </div>
            </div>
         );
    }
}

export default Game;