class GuestBookEntry < ApplicationRecord
  mount_uploader :image_one_url, PhotosUploader
  mount_uploader :image_two_url, PhotosUploader
  mount_uploader :image_three_url, PhotosUploader
  enum admin_state: [:submitted, :rejected, :accepted]
  validates :title, presence: true
  validates :body, presence: true
  validates_size_of :image_one_url, maximum: 10.megabytes, message: "should be less than 10MB"
  validates_size_of :image_two_url, maximum: 10.megabytes, message: "should be less than 10MB"
  validates_size_of :image_three_url, maximum: 10.megabytes, message: "should be less than 10MB"
end
