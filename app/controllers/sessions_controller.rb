class SessionsController < ApplicationController
    def create
        user = User.find_by(email: user_params[:email])
        if user && user.authenticate(user_params[:password])
            token = encode_token(user.id)
            render json: { user: UserSerializer.new(user), token: token }
        else
            render json: { errors: "Invalid Email or Password"} 
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
