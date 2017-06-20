class Album < ApplicationRecord
  has_many :photos
  self.per_page = 6

  def self.search(search)
    where('title LIKE ?', "%#{search}%")
  end

  def title_photo
    if photos.blank?
      '/assets/default_photo.png'
    else
      photos.last.picture.url(:thumb)
    end
  end
end
