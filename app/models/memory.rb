class Memory < ApplicationRecord
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :tags
  mount_uploader :image, PhotosUploader
end
