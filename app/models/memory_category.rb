class MemoryCategory < ApplicationRecord
  belongs_to :memory
  accepts_nested_attributes_for :memory, :allow_destroy => true
  belongs_to :category
  accepts_nested_attributes_for :category, :allow_destroy => true
end