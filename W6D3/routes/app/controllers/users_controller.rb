class UsersController < ApplicationController
    def index
        query = request.query_parameters[:username]
        if query
            render json: User.where(username: query)
        else
            @users = User.all
            render :index
        end
    end

    def new
        render :new
    end
    
    def edit
        p params
        @user = User.find_by(id: params[:id])
        p params[:id]
        p @user
        render :edit
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render :new
        end
    end

    def show
        user = User.find_by(id: params[:id])
        if user
            render json: user
        else
            render json: ['User does not exist'], status: :unprocessable_entity
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        if user
            user_copy = User.new(id: user.id, username: user.username)
            if user.destroy
                render json: user_copy
            else
                render json: user.errors.full_messages, status: :unprocessable_entity
            end
        else
            render json: ['User does not exist'], status: :unprocessable_entity
        end
    end

    def update
        @user = User.find_by(id: params[:id])
        if @user
            if @user.update(user_params)
                render :edit
            else
                render :edit
            end
        else
            render json: ['User does not exist'], status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :age)
    end
end