class SessionsController < ApplicationController
    def create
        user = User.find_by(email: user_params[:email])
        trainer = Trainer.find_by(email: user_params[:email])
        if user && user.authenticate(user_params[:password])
            token = encode_token(user.id)
            render json: { user: UserSerializer.new(user), token: token }
        elsif trainer && trainer.authenticate(trainer_params[:password])
            token = encode_token(user.id)
            render json: { trainer: TrainerSerializer.new(user), token: token }
        else
            render json: { errors: "Invalid Email or Password"} 
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end

    def trainer_params
        params.require(:trainer).permit(:email, :password)
    end
end
