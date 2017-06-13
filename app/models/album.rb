class Album < ApplicationRecord
  has_many :photos


  def title_photo
    if photos.blank?
      "/assets/default_photo.png"
    else
      photos.last.picture.url(:thumb)
    end
  end
end
