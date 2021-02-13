class Dog < ApplicationRecord
    has_one_attached :avatar
    belongs_to :user
    has_many :training_session_dogs
    has_many :training_sessions, through: :training_session_dogs
    has_many :trainers, through: :training_sessions
    has_many :courses, through: :training_sessions

    validates :name, :breed, :age, :last_shot_date, presence: true
    validate :acceptable_image

    scope :users_dogs_by_name, -> (current_user) { where("user_id =?", current_user).order("name asc")}
    
    def date_of_shots
        self.last_shot_date.strftime("%B %d, %Y")
    end

    def update_shot_records
        if (self.last_shot_date + 1.year) <= Date.current
            self.update(shots: false)
        else
            self.update(shots: true)
        end
    end

    def self.owners_dogs(owner)
        where(user_id: owner)
    end

    def acceptable_image
        return unless avatar.attached?

        acceptable_types = ["image/jpeg", "image/png"]
        unless acceptable_types.include?(avatar.content_type)
            errors.add(:avatar, "must be a JPEG or PNG")
        end
    end
end
