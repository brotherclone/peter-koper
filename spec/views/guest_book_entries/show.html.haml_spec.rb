require 'rails_helper'

RSpec.describe "guest_book_entries/show", type: :view do
  before(:each) do
    @guest_book_entry = assign(:guest_book_entry, GuestBookEntry.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
