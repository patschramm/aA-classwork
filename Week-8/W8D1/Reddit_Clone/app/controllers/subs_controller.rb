class SubsController < ApplicationController
    before_action :require_login, except: [:index, :show]
    before_action :require_moderator, only: [:edit, :update]

    def index
        @subs = Sub.all
        render :index
    end

    def new
        @sub = Sub.new
        render :new
    end

    def show
        @sub = Sub.find_by(id: params[:id])
        # @sub.moderator_id = params[:user_id]
        render :show
    end

    def create
        @sub = Sub.create(sub_params)
        @sub.moderator_id = current_user.id

        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def edit
        @sub = Sub.find_by(id: params[:id])
        render :edit
    end

    def update
        @sub = Sub.find_by(id: params[:id])

        if @sub && @sub.update(sub_params)
            redirect_to sub_url(id: params[:id])
        else
            flash.now[:errors] = ['Input error!']
            render :edit
        end
    end


    private

    def sub_params
        params.require(:sub).permit(:title, :description, :moderator_id)
    end

    def require_moderator
        @sub = Sub.find_by(id: params[:id])
        
        render json: "Forbidden", status: 403 unless @sub.moderator_id == current_user.id
    end
end
