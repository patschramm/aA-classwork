function FollowToggle($el) {
    // debugger
    this.userId = $el.data('userid');
    this.followState = $el.data('initialfollowstate');
    this.$el = $el;
    this.render();
    this.handleClick();
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
    // debugger
    this.$el.on("click", (e) => {
        // debugger
    //    e.preventDefault();
       if (!this.followState) {
           return $.ajax({
               type: "POST",
               url: `/users/${this.userId}/follow`,
               dataType: "JSON",
               success: this.toggle()
           })
       } else {
           return $.ajax({
               type: "DELETE",
               url: `/users/${this.userId}/follow`,
               dataType: "JSON",
               success: this.toggle()
           })
       }
    })
}

FollowToggle.prototype.toggle = function () {
    // debugger
    if (this.followState) {
        this.followState = false;
    } else {
        this.followState = true;
    }

    this.render();
}

module.exports = FollowToggle;