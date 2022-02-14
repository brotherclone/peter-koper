class Tag < ApplicationRecord
  has_and_belongs_to_many :memories
  accepts_nested_attributes_for :memories
  has_and_belongs_to_many :categories
  accepts_nested_attributes_for :categories
  validates :name, presence: true
end
