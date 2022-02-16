class AudioCommentary < ApplicationRecord
  belongs_to :memory
  validates :file, presence: true
  mount_uploader :file, AudioUploader
end