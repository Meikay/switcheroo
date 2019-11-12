class UsersController < ApplicationController
    #loading signup form
    def new
        @user = User.new
    end

    #signup
    def create
        @user = User.new(user_params)
        if @user
            #login the user
            session[:user_id] = @user.id
            redirect_to users_path   #users/index
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :age, :password)
    end
end
