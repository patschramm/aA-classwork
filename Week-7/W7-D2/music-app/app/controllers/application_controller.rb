class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    #CRRLLL
    #current_user
    #require_log_in
    #require_log_out
    #log_in(user)
    #log_out
    #logged_in?

    skip_before_action :verify_authenticity_token

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_user
    end

    def require_log_in
        redirect_to new_session_url unless logged_in?
    end

    def require_log_out
        redirect_to users_url if logged_in?
    end

    def log_in(user)
       session[:session_token] = user.reset_session_token!
    end

    def log_out
        current_user.reset_session_token! if logged_in?
        session[:session_token] = nil
        @current_user = nil
    end
end
