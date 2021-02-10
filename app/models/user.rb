class User < ApplicationRecord
    has_many :dogs
    has_many :training_sessions, through: :dogs
    has_many :courses, through: :training_sessions
    has_secure_password

    has_one_attached :photo

    validates :username, uniqueness: true, on: :create
    validates :email, uniqueness: true
    validate :valid_email, on: :create
    validates :username, :first_name, :last_name, :phone_number, :email, presence: true
    validates :password, presence: true, on: :create
    validates :phone_number, numericality: { only_integer: true }

    def name
        self.first_name.downcase.capitalize + " " + self.last_name.downcase.capitalize
    end

    def display_username
        self.username.downcase.capitalize
    end

    def display_phone_number
        "(#{self.phone_number[0..2]}) #{self.phone_number[3..5]} - #{self.phone_number[6..9]}"
    end

    def self.find_user(email)
        user = where(email: email)
        if user.count > 1
            nil
        else
            user.first
        end
    end

    def self.find_or_create_user_by_github(resource)
        result = {created: false}
        user = self.find_user(resource['email'].downcase)
        if !user
            name = resource['name'].split(" ")
            user = self.create(
                first_name: name[0], 
                last_name: (name[1] ? name[1] : "Add Last Name"), 
                username: resource['nickname'],
                phone_number: 0000000000,
                email: resource['email'].downcase,
                password: "add_password",
                password_confirmation: "add_password"
            )
            result[:created] = true
        end
        result[:user] = user
        result
    end

    def valid_email
        if email && Trainer.find_by(email: email)
            errors.add(:email, "is already in use.")
        end
    end

end
