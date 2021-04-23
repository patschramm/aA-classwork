class ArtworkSharesController < ApplicationController
    def index
        if params[:user_id]
            user = User.find_by(id: params[:user_id])
            render json: user.artwork_shares
        else
            render json: ArtworkShare.all
        end
    end

    def create
        artwork_share = ArtworkShare.new(artwork_share_params)
        if artwork_share.save
            render json: artwork_share
        else
            render json: artwork_share.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        artwork_share = ArtworkShare.find_by(id: params[:id])
        if artwork_share
            artwork_share_copy = ArtworkShare.new(artwork_share.attributes)
            if artwork_share.destroy
                render json: artwork_share_copy
            else
                render json: artwork_share.errors.full_messages, status: :unprocessable_entity
            end
        else
            render json: ['Artwork Share does not exist'], status: :unprocessable_entity
        end
    end

    private

    def artwork_share_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end
end
