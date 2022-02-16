class GuestBookEntry < ApplicationRecord
  mount_uploader :image_one_url, PhotosUploader
  mount_uploader :image_two_url, PhotosUploader
  mount_uploader :image_three_url, PhotosUploader
  enum admin_state: [:submitted, :rejected, :accepted]
  validates :title, presence: true
  validates :body, presence: true
end
