class GuestBookEntry < ApplicationRecord
  enum admin_state: [:submitted, :rejected, :accepted]
  validates :title, presence: true
  validates :body, presence: true
end
