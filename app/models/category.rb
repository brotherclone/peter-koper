class Category < ApplicationRecord
  has_and_belongs_to_many :memories
  belongs_to :tag
  validates :name, presence: true
end
