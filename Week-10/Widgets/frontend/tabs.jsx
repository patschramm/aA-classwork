import React, { Component } from 'react';

class Tabs extends Component {
    constructor(props) {
        super(props);
        this.state = {currIdx: 0}
        this.click = this.click.bind(this)
    }

    click(idx) {
        this.setState({currIdx: idx})
    }

    render() { 
        return ( 
            <div className="tab-section">
                <h1>Tabs</h1>
                    <div className="tabs">
                        {this.props.tabs.map((tab, i) => {
                        return (
                            <h2 onClick={() => this.click(i)} key={i}>{tab.title}</h2>
                            );
                    })}
                    </div>
                <article>{this.props.tabs[this.state.currIdx].content}</article>
            </div>
        );
    }
}
 
export default Tabs;