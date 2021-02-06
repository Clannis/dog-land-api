class TrainerSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :first_name, :last_name, :phone_number, :certification
end
