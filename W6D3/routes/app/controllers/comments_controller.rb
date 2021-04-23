class CommentsController < ApplicationController

    # /comments/
    def index
        if params[:user_id]
            render json: User.find_by(id: params[:user_id]).comments
        elsif params[:artwork_id]
            render json: Artwork.find_by(id: params[:artwork_id]).comments
        else
            render json: Comment.all
        end
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save!
            render json: comment
        else
            # error
        end
    end

    def destroy
        comment = Comment.find_by(id: params[:id])
        if comment.destroy!
            render json: comment
        else

        end
    end

    private

    def comment_params
        params.permit(:user_id, :artwork_id, :body)
    end

end
