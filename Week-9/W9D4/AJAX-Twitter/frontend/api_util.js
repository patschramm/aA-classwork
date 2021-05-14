const APIUtil = {
    followUser: (id, success) => {
        return $.ajax({
                type: "POST",
                url: `/users/${id}/follow`,
                dataType: "JSON",
                success
        });
    },

    unfollowUser: (id, success) => {
        return $.ajax({
                type: "DELETE",
                url: `/users/${id}/follow`,
                dataType: "JSON",
                success
        });
    }
};

module.exports = APIUtil;