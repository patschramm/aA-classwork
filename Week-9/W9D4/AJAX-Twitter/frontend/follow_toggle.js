function FollowToggle($el) {
    this.userId = $el.data.userId;
    this.followState = $el.data.initialFollowState;
    this.$el = $el;
    this.render();
}

FollowToggle.prototype.render = function () {
    if (!this.followState) {
        this.$el.val("Follow");
    } else {
        this.$el.val("Unfollow");
    }
    // $('body').append($el);
}

FollowToggle.prototype.handleClick = function () {
    this.$el.on("click", (e) => {
       e.preventDefault();
       if (!this.followState) {
           let followChange = $.ajax({
               method: "POST",
               url: `users/${this.userId}/follow`,
               dataType: "JSON",
           })
       }
    })
}

module.exports = FollowToggle;