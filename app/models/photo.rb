class Photo < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :album
  validates_presence_of :picture
  validates_presence_of :title
end
