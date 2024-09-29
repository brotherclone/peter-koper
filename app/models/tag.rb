class Tag < ApplicationRecord
  has_many :tag_memories
  has_many :memories, :through => :tag_memories
  validates :name, presence: true
  enum display_state: [:on, :hinted, :selected]
  attr_accessor :display_state

  def self.ransackable_attributes(auth_object = nil)
    %w[id name created_at display_state]
  end

  def self.ransackable_associations(auth_object = nil)
    ["memories", "tag_memories"]
  end
end
