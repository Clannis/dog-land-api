class DogSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :breed, :age, :shots, :lastShotDate, :avatar

  def lastShotDate
    object.last_shot_date
  end

  def avatar
    rails_blob_url(object.avatar)
  end
end
