class SessionsController < ApplicationController

    def create
        debugger
        @user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )
        if @user
            log_in(@user)
            redirect_to users_url
        else
            flash[:errors] = ["Wrong email or password, friend!"]
            redirect_to new_session_url
        end
    end

    def destroy
        log_out
        redirect_to new_session_url
    end

    def new
        render :new
    end
end
