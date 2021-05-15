class SessionsController < ApplicationController
    def index
        if signed_in?
            render json: current_user, except: [:password_digest, :password_confirmation, :created_at, :updated_at]
        else
            render json: nil
        end
    end

    def create
        user = User.find_by(username: params[:username])
        if signed_in?
            render json: { errors: ["Already signed in!"] }
        elsif user && user.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, except: [:password_digest, :password_confirmation, :created_at, :updated_at]
        else
            render json: nil
        end
    end

    def destroy
        session.delete(:user_id)
        render json: nil
    end

    def session_params
        params.require(:user).permit(:username, :password)
    end
end
