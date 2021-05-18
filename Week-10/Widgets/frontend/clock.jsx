import React, { Component } from 'react';

class Clock extends Component {
    constructor(props) {
        super(props);
        this.state = {date: new Date()};
        this.tick = this.tick.bind(this);
    }

    componentDidMount() {
        this.intervalId = setInterval(this.tick, 1000)
    }

    componentWillUnmount() {
        clearInterval(this.intervalId);

    }

    tick() {
        this.setState({date: new Date()})
    }

    render() { 
        let hrs = this.state.date.getHours() % 12
        let mins = this.state.date.getMinutes()
        let secs = this.state.date.getSeconds()

        return (  
            <div>
                <h1>Clock</h1>
                <h1>{hrs}:{mins}:{secs}</h1>
            </div>
        );
    }
}
 
export default Clock;