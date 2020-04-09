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

    def google #find or create a user using the attribute auth
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
            user.username = auth["info"]["first_name"]
            user.password = SecureRandom.hex(10)
        end
        if @user.save
            session[:user_id] = @user.id
            Cart.create(:user => @user.id) #creates a cart as soon as the user signs in
            redirect_to user_path(@user)
        else
            redirect_to '/'
        end
    end

    #Logout route
    def destroy
        session.clear
        redirect_to '/'
    end

    private
 
    def auth
        request.env['omniauth.auth']
    end
end