class AudioCommentary < ApplicationRecord
  belongs_to :memory
  validates :file, presence: true
end