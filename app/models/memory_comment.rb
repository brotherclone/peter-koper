class MemoryComment < ApplicationRecord
  belongs_to :memory
  accepts_nested_attributes_for :memory
  validates :author_name, presence: true
  validates :author_email, presence: true
  validates :body, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[id memory_id author_name author_email body created_at is_live]
  end

  def self.ransackable_associations(auth_object = nil)
    ["memory"]
  end
end
