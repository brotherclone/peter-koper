class Memory < ApplicationRecord
  has_many :tag_memories
  has_many :tags, :through => :tag_memories
  has_many :memory_categories
  has_many :categories, :through => :memory_categories
  mount_uploader :image, PhotosUploader
  enum fuzzy_date: [:regular, :month, :year, :decade]
  validates :occurrence, presence: true
  has_one :video
end
