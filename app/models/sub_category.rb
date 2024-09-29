class SubCategory < ApplicationRecord
  validates :name, presence: true
  belongs_to :category
  def self.ransackable_attributes(auth_object = nil)
    %w[id name category_id]
  end
  def self.ransackable_associations(auth_object = nil)
    ["category"]
  end
end