class MemorySubCategory < ApplicationRecord
  belongs_to :memory
  accepts_nested_attributes_for :memory, :allow_destroy => true
  belongs_to :sub_category
  accepts_nested_attributes_for :sub_category, :allow_destroy => true
end