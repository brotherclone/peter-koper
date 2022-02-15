class GuestBookEntry < ApplicationRecord
  enum admin_state: [:submitted, :rejected, :accepted]
end
