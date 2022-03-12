class Tag < ApplicationRecord
  has_many :tag_memories
  has_many :memories, :through => :tag_memories
  validates :name, presence: true
  enum display_state: [:on, :hinted, :selected]
  attr_accessor :display_state
end
