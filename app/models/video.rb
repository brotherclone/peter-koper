class Video < ApplicationRecord
  belongs_to :memory
  accepts_nested_attributes_for :memory
  enum video_service: [:youtube, :vimeo]
  validates :url, presence: true
  validates :video_service, presence: true
  validates :video_id, presence: true
end