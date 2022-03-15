class MemorySubCategory < ApplicationRecord
  belongs_to :memory
  accepts_nested_attributes_for :memory
  belongs_to :sub_category
  accepts_nested_attributes_for :sub_category
end