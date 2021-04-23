class ArtworksController < ApplicationController
    def index
        if params[:user_id]
            user = User.find_by(id: params[:user_id])
            if user
                artworks = user.artwork_shares.map do |artwork_share|
                    artwork_share.artwork
                end
                render json: user.artworks + artworks
            else
                render json: user.errors.full_messages, status: :unprocessable_entity
            end
        else
            artworks = Artwork.all
            render json: artworks
        end
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        artwork = Artwork.find_by(id: params[:id])
        if artwork
            render json: artwork
        else
            render json: ['Artwork does not exist'], status: :unprocessable_entity
        end
    end

    def destroy
        artwork = Artwork.find_by(id: params[:id])
        if artwork
            artwork_copy = Artwork.new(artwork.attributes)
            if artwork.destroy
                render json: artwork_copy
            else
                render json: artwork.errors.full_messages, status: :unprocessable_entity
            end
        else
            render json: ['Artwork does not exist'], status: :unprocessable_entity
        end
    end

    def update
        artwork = Artwork.find_by(id: params[:id])
        if artwork
            if artwork.update(artwork_params)
                render json: artwork
            else
                render json: artwork.errors.full_messages, status: :unprocessable_entity
            end
        else
            render json: ['Artwork does not exist'], status: :unprocessable_entity
        end
    end

    private

    def artwork_params
        params.permit(:title, :image_url, :artist_id)
    end
end
