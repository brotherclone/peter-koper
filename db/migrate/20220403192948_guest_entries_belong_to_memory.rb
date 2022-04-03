class GuestEntriesBelongToMemory < ActiveRecord::Migration[6.1]
  def self.up
    add_reference :guest_book_entries, :memory, index: true
  end
  def self.down
    remove_reference :guest_book_entries, :memory
  end
end
