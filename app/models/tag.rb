class Tag < ApplicationRecord
  has_and_belongs_to_many :memories
  has_many :categories
  validates :name, presence: true
end
