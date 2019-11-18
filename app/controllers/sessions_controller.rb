require 'rack-flash'
require 'pry'
class SessionsController < ApplicationController

    use Rack::Flash

    def new
        @user = User.new
        render :login
    end

    #login
    def create
        @user = User.find_by(email: params[:user][:email]) 
        #binding.pry  #=> This is where the pry hits when login
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error] = "Sorry, your email or password was incorrect"
            redirect_to '/login'
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