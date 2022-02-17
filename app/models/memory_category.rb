class MemoryCategory < ApplicationRecord
  belongs_to :memory
  accepts_nested_attributes_for :memory
  belongs_to :category
  accepts_nested_attributes_for :category
end