class DogSerializer < ActiveModel::Serializer
  attributes :id, :name, :breed, :age, :shots, :lastShotDate

  def lastShotDate
    object.last_shot_date
  end
end
