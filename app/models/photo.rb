class Photo < ApplicationRecord
  mount_uploader :image, PhotosUploader
  belongs_to :memory
end
