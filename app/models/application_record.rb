class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def set_default_avatar
    unless self.avatar.attached?
      self.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'dog_default.jpg')), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
  end

end
