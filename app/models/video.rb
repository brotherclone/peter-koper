class Video < ApplicationRecord
  belongs_to :memory
  accepts_nested_attributes_for :memory
  enum video_service: [:vimeo, :youtube]
end