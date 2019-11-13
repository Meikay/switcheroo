require 'rack-flash'
class SessionsController < ApplicationController
    use Rack::Flash
    def new
        @user = User.new
        render :login
    end

    def create
        @user = User.find_by(username: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to users_path
        else
            flash[:error] = "Sorry, your email or password was incorrect"
            redirect_to '/login'  #must redirect - cant render because we used form_for instead of form_tag
        end
    end

    def home
    end

    #Logout route
    def destroy
        session.clear
        redirect_to '/'
    end
end

#Add flash messages
#write out home method in sessions and figure out why it wont login
#take a look at requirements