import React, { Component } from 'react';

class Tabs extends Component {
    constructor(props) {
        super(props);
        this.state = {}
        this.click = this.click.bind(this)
    }

    click(e) {
        const indx = e.target.id;
        const articles = document.getElementsByTagName('article');
        const articleArr = Array.from(articles)[indx];
        articleArr.forEach((article) => {
            if (article.id === indx) {
                article.className = 'show';
            } else {
                article.className = 'hide'
            }

        })
    }

    render() { 
        return ( 
            <div>
                <h1>Tabs</h1>
                <ul>
                    <li onClick={this.click}>
                        <h1 id='0'>{this.props.tabs[0].title}</h1>
                    </li>
                    <li onClick={this.click}>
                        <h1 id='1'>{this.props.tabs[1].title}</h1>
                    </li>
                    <li onClick={this.click}>
                        <h1 id='2'>{this.props.tabs[2].title}</h1>
                    </li>
                </ul>

                <article className="show">{this.props.tabs[0].content}</article>
                <article className="hide">{this.props.tabs[1].content}</article>
                <article className="hide">{this.props.tabs[2].content}</article>
            </div>
        );
    }
}
 
export default Tabs;