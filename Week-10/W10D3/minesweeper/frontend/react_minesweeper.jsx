import React from "react";
import ReactDOM from "react-dom";
import Game from "./game.jsx";

document.addEventListener("DOMContentLoaded", () => {
    const main = document.getElementById("main");
    ReactDOM.render(<Game/>, main);
});

