class Video < ApplicationRecord
  mount_uploader :file, VideoUploader
  belongs_to :memory
  accepts_nested_attributes_for :memory
end