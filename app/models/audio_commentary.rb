class AudioCommentary < ApplicationRecord
  mount_uploader :file, AudioUploader
  belongs_to :memory
  accepts_nested_attributes_for :memory
end