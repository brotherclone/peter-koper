class TagMemory < ApplicationRecord
  belongs_to :tag
  accepts_nested_attributes_for :tag
  belongs_to :memory
  accepts_nested_attributes_for :memory
end