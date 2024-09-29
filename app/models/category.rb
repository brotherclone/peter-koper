class Category < ApplicationRecord
  has_many :memory_categories
  has_many :memories, :through => :memory_categories
  validates :name, presence: true
  enum display_state: [:on, :off, :hinted]
  attr_accessor :display_state
  has_many :sub_categories
  mount_uploader :image, PhotosUploader
  validates_size_of :image, maximum: 10.megabytes, message: "should be less than 10MB"
  def self.ransackable_attributes(auth_object = nil)
    %w[id name created_at updated_at image]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[memory_categories memories sub_categories]
  end
end
