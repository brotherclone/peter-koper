class Memory < ApplicationRecord
  has_many :tag_memories, :dependent => :destroy
  has_many :tags, :through => :tag_memories
  has_many :memory_categories, :dependent => :destroy
  has_many :categories, :through => :memory_categories
  has_many :memory_sub_categories, :dependent => :destroy
  has_many :sub_categories, :through => :memory_sub_categories
  mount_uploader :image, PhotosUploader
  enum fuzzy_date: [:regular, :month, :year, :decade, :no_show]
  validates :occurrence, presence: true
  validates :title, presence: true
  has_one :video
  has_one :pdf
  has_many :memory_comments
  validates_size_of :image, maximum: 10.megabytes, message: "should be less than 10MB"
end
