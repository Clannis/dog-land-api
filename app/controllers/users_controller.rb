class UsersController < ApplicationController

    def create
        user = User.new(user_params)
        if user.save
            token = encode_token(user.id)
            render json: { user: UserSerializer.new(user), token: token }
        else
            render json: { errors: user.errors.full_messages.to_sentence} 
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :phone_number, :email, :password)
    end

end
