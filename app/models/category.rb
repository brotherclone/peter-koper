class Category < ApplicationRecord
  has_and_belongs_to_many :memories
  accepts_nested_attributes_for :memories
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags
  validates :name, presence: true
end
