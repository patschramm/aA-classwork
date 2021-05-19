import React from 'react';
import Tile from './tile.jsx';

class Board extends React.Component {
    constructor(props) {
        super(props);
        this.state = {  };
        
    }
    render() { 
        // const board=this.props.board;
        return ( 
            <div id="board">
                {this.props.board.grid.map((row, i) => {
                    return <div key={i} className="row">
                        {row.map((tile, j) => {
                           return <Tile tile={tile} updateGame={this.props.updateGame} key={i*2+j}/>
                        })}
                    </div>
                })}
            </div>

         );
    }
}
 
export default Board;