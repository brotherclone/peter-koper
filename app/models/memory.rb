class Memory < ApplicationRecord
  belongs_to :category
  mount_uploader :image, PhotosUploader
end
