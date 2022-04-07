class Video < ApplicationRecord
  belongs_to :memory
  accepts_nested_attributes_for :memory
  enum video_service: [:vimeo, :youtube]
  enum aspect_ratio: [:sixteen_by_nine, :nine_by_sixteen, :four_by_three]
  validates :aspect_ratio, presence: true
end