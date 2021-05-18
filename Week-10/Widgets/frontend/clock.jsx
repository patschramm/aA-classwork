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
        let hrs = this.state.date.getHours() % 12;
        let mins = this.state.date.getMinutes();
        let secs = this.state.date.getSeconds();
        let dt = this.state.date.toDateString();

        hrs = (hrs < 10) ? '0' + hrs : hrs;
        mins = (mins < 10) ? '0' + mins : mins;
        secs = (secs < 10) ? '0' + secs : secs;

        return (  
            <div id="clock">
                <div id="clock-titles">
                    <h1>Date</h1>
                    <h1>Clock</h1>
                </div>

                <div id="time-date">
                    <h1>{dt}</h1>
                    <h1>{hrs}:{mins}:{secs}</h1>
                </div>
            </div>
        );
    }
}
 
export default Clock;