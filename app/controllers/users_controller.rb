class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to new_user_path
        end
    end

    def show
        if session[:user_id] 
            @user = User.find(session[:user_id])
        else
            redirect_to '/login'
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
