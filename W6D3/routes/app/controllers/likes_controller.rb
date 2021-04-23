class LikesController < ApplicationController

    def index
        if params[:comment_id]
            comment = Comment.find_by(id: params[:comment_id])
            render json: comment.likes
        else
            render json: Like.all
        end
    end



end