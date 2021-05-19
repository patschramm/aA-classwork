import React from 'react';

class Tile extends React.Component {
    constructor(props) {
        super(props);
        this.state = {  }
        this.handleClick = this.handleClick.bind(this);

    }

    handleClick(e) {
        let flag = e.altKey ? true : false;
        this.props.updateGame(this.props.tile, flag);
    }

    render() { 
        let content;
        let that = this.props.tile;
        let status;
        let displayed;
        if (that.explored) {
            if (that.bombed) {
                status = "bombed";
                displayed = "💣"
            }else{
                status = "explored";
                displayed = that.adjacentBombCount() > 0 ? `${that.adjacentBombCount()}` : "";
            };
        } else if (that.flagged) {
            status = "flagged";
            displayed = "🏁"
        } else {
            status = "unexplored";
            displayed=""
        }
        
        return ( 
            <div className={status} onClick={this.handleClick}>{displayed}</div>
         );
    }
}
 
export default Tile;