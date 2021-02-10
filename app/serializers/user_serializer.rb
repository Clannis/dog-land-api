class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :name, :phoneNumber

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
