class Tag < ApplicationRecord
  has_many :tag_memories
  has_many :tags, :through => :tag_memories
  has_many :tag_categories
  has_many :tags, :through => :tag_categories
  validates :name, presence: true
end
