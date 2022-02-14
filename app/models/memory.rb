class Memory < ApplicationRecord
  has_many :tag_memories
  has_many :tags, :through => :tag_memories
  has_many :memory_categories
  has_many :memories, :through => :memory_categories
  mount_uploader :image, PhotosUploader
  enum fuzzy_date: [:regular, :day, :month, :year]
  validates :occurrence, presence: true
end
