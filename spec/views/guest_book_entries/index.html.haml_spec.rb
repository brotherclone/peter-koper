require 'rails_helper'

RSpec.describe "guest_book_entries/index", type: :view do
  before(:each) do
    assign(:guest_book_entries, [
      GuestBookEntry.create!(),
      GuestBookEntry.create!()
    ])
  end

  it "renders a list of guest_book_entries" do
    render
  end
end
