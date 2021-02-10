class TrainerSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :name, :phoneNumber, :certification

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
