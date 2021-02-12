class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :username, :email, :name, :phoneNumber, :photo

  has_many :dogs
    
  def photo
      rails_blob_path(object.photo, only_path: true) if object.photo.attached?
  end

  def phoneNumber  
    object.display_phone_number
  end

  def name
    object.name
  end

  def username
    object.display_username
  end

end
