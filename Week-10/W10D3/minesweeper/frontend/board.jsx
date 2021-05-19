import React from 'react';
import Tile from './tile.jsx';

class Board extends React.Component {
    constructor(props) {
        super(props);
        this.state = {  };
    }
    render() { 
        return ( 
            <div>
                {this.props.board.map((row, i) => {
                    <div>
                        {row.map((tile, j) => {
                            
                        })}
                    </div>
                })}
            </div>

            //  <div className="tabs">
            //             {this.props.tabs.map((tab, i) => {
            //             return (
            //                 <h2 onClick={() => this.click(i)} key={i}>{tab.title}</h2>
            //                 );
            //         })}


         );
    }
}
 
export default Board;