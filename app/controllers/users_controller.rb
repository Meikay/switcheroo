require 'pry'
class UsersController < ApplicationController
    #loading signup form
    def new
        @user = User.new
    end

    #signup
    def create
        @user = User.new(user_params)
        if @user.save
            #login the user
            session[:user_id] = @user.id
            Cart.create(:user => @user.id)
            redirect_to user_path(@user)   #users/index
        else
            render :new
        end
    end

    #finding user's id and account info
    def show
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :age, :password)
    end
end
