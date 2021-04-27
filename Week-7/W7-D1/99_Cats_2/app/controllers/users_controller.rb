class UsersController < ApplicationController
    
    def index
        @users = User.all

        render :index
    end

    def create
        @user = User.new(user_params)

        if @user.save
            login_user!(@user)
            redirect_to cats_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def new
        @user = User.new
        render :new
    end


    private

    def user_params
        params.require(:user).permit(:password, :username)
    end
end
