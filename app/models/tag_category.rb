class TagCategory < ApplicationRecord
  belongs_to :tag
  accepts_nested_attributes_for :tag
  belongs_to :category
  accepts_nested_attributes_for :category
end