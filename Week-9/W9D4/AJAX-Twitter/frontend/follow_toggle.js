const APIUtil = require('./api_util.js');

class FollowToggle {

    constructor($el) {
        // debugger
        this.userId = $el.data('userid');
        this.followState = $el.data('initialfollowstate');
        this.$el = $el;
        this.render();
        this.$el.on("click", (e) => this.handleClick(e)) 
    }

    render () {
        if (!this.followState) {
            this.$el.val("Follow");
        } else {
            this.$el.val("Unfollow");
        }
    }

    handleClick (e) {
        e.preventDefault();
        // if (!this.followState) {
        //     return $.ajax({
        //         type: "POST",
        //         url: `/users/${this.userId}/follow`,
        //         dataType: "JSON",
        //         success: () => this.toggle()
        //     })
        // } else {
        //     return $.ajax({
        //         type: "DELETE",
        //         url: `/users/${this.userId}/follow`,
        //         dataType: "JSON",
        //         success: () => this.toggle()
        //     })
        // debugger
        let that = this;
        if (!this.followState) {
            APIUtil.followUser(this.userId)
                .then(that.toggle());
        } else {
            APIUtil.unfollowUser(this.userId)
                .then(that.toggle());
        }
    }

    toggle () {
        // debugger
        if (this.followState) {
            this.followState = false;
        } else {
            this.followState = true;
        }

        this.render();
    }

}

module.exports = FollowToggle;