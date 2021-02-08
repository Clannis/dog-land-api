class TrainersController < ApplicationController

    def create
        trainer = Trainer.new(trainer_params)
        if trainer.save
            token = encode_token(trainer.id)
            render json: { trainer: TrainerSerializer.new(trainer), token: token }
        else
            render json: { errors: trainer.errors.full_messages.to_sentence} 
        end
    end

    private

    def trainer_params
        params.require(:trainer).permit(:username, :first_name, :last_name, :phone_number, :email, :password, :certification)
    end
end
