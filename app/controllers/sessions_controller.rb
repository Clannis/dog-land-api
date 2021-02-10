class SessionsController < ApplicationController
    def create
        user = User.find_by(email: user_params[:email])
        trainer = Trainer.find_by(email: user_params[:email])
        if user && user.authenticate(user_params[:password])
            token = encode_token(user.id)
            render json: { user: UserSerializer.new(user), token: token }
        elsif trainer && trainer.authenticate(user_params[:password])
            token = encode_token(trainer.id)
            render json: { trainer: TrainerSerializer.new(trainer), token: token }
        else
            render json: { errors: "Invalid Email or Password"} 
        end
    end

    def autologin
        if params[:type]
            if params[:type] == "user"
                user = session_user
            else
                trainer = session_trainer
            end
        end
        if user
            token = encode_token(user.id)
            render json: {user: UserSerializer.new(user), token: token}
        elsif trainer
            token = encode_token(trainer.id)
            render json: {trainer: TrainerSerializer.new(trainer), token: token}
        else
            render json: {errors: "Dont try and hack me. I see YOU!"}
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
