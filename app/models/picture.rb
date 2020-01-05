class Picture < ApplicationRecord
  belongs_to :review
  mount_uploader :image, ImageUploader
end