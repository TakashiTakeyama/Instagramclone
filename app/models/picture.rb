class Picture < ApplicationRecord
  mount_uploader :image,ImageUploader
  # validates :image, uniqueness: true
end
