json.extract! guest_book_entry, :id, :created_at, :updated_at
json.url guest_book_entry_url(guest_book_entry, format: :json)
