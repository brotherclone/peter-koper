class MemoryComment < ApplicationRecord
  belongs_to :memory
  accepts_nested_attributes_for :memory
  validates :author_name, presence: true
  validates :author_email, presence: true
  validates :body, presence: true

end
