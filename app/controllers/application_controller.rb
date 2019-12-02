class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?  #gives access to views
    include ApplicationHelper
   
   
   
   
   
    private

    
        def current_user
            @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
        end
        
        def logged_in?
            current_user != nil
        end

        def redirect_if_not_logged_in
            redirect_to '/' if !logged_in?
        end

end
