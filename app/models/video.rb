class Video < ApplicationRecord
  mount_uploader :file, VideoUploader
  belongs_to :memory
  accepts_nested_attributes_for :memory
  validates_size_of :file, maximum: 100.megabytes, message: "should be less than 100MB"
end