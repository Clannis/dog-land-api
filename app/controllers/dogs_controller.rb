class DogsController < ApplicationController
    before_action :set_session_user

    def create
        if @user
            dog = @user.dogs.new(dog_params)
            if dog.save
                dog.update_shot_records
                render json: { dog: DogSerializer.new(dog) }
            else
                render json: { errors: dog.errors.full_messages.to_sentence}
            end
        else
            render json: {errors: "Dont try and hack me. I see YOU!"}
        end
    end

    def update
        if @user
            dog = @user.dogs.find(params[:id])
            if dog.update(dog_params)
                dog.update_shot_records
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
