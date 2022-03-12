class Category < ApplicationRecord
  has_many :memory_categories
  has_many :memories, :through => :memory_categories
  validates :name, presence: true
  enum display_state: [:on, :off, :hinted]
  attr_accessor :display_state
end
