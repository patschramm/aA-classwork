let FollowToggle = require ("./follow_toggle.js");
window.FollowToggle = FollowToggle;

$(document).ready(function () {
    const $followButtons = $("input.follow_toggle");
    $followButtons.each((idx, el) => new FollowToggle($(el)));
});