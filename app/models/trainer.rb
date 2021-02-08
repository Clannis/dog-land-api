class Trainer < ApplicationRecord
    has_one_attached :avatar
    has_many :training_sessions
    has_many :courses, through: :training_sessions
    has_many :dogs, through: :training_sessions
    has_many :users, through: :dogs

    has_secure_password
    validates :username, uniqueness: true
    validates :email, uniqueness: true
    validates :phone_number, numericality: { only_integer: true }
    validates :username, :first_name, :last_name, :phone_number, :email, :certification, presence: true
    validates :password, presence: true, on: :create
    
    def name
        self.first_name.downcase.capitalize + " " + self.last_name.downcase.capitalize
    end

    def display_phone_number
        "(#{self.phone_number[0..2]}) #{self.phone_number[3..5]} - #{self.phone_number[6..9]}"
    end

    def self.find_trainer(email)
        trainer = where(email: email)
        if trainer.count > 1
            nil
        else
            trainer.first
        end
    end
end
