class Pdf < ApplicationRecord
  mount_uploader :file, PhotosUploader
  belongs_to :memory
  accepts_nested_attributes_for :memory

end