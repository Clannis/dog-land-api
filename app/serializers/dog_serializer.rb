class DogSerializer < ActiveModel::Serializer
  attributes :id, :name, :breed, :age, :shots, :last_shot_date
end
