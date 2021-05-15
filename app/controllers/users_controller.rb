class UsersController < ApplicationController
    def index
        render json: User.all, except: [:password_digest, :password_confirmation, :created_at, :updated_at]
    end

    def create
        user = User.new(username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])

        if user.save
            session[:user_id] = user.id
            render json: user, except: [:password_digest, :password_confirmation, :created_at, :updated_at]
        else
            render json: { errors: user.errors.full_messages }
        end
    end

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
