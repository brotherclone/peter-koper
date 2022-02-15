class Video < ApplicationRecord
  belongs_to :memory
  enum video_service: [:youtube, :vimeo]
end