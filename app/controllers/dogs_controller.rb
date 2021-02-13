class DogsController < ApplicationController
    before_action :set_session_user

    def create
        if @user
            dog = @user.dogs.new(dog_params)
            byebug
            if dog.save
                byebug
                dog.update_shot_records
                byebug
                render json: { dog: DogSerializer.new(dog) }
            else
                render json: { errors: dog.errors.full_messages.to_sentence}
            end
        else
            render json: {errors: "Dont try and hack me. I see YOU!"}
        end
    end

    private

    def dog_params
        params.require(:dog).permit(:name, :breed, :age, :last_shot_date, :avatar)
    end

end
