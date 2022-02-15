require 'rails_helper'

RSpec.describe "guest_book_entries/edit", type: :view do
  before(:each) do
    @guest_book_entry = assign(:guest_book_entry, GuestBookEntry.create!())
  end

  it "renders the edit guest_book_entry form" do
    render

    assert_select "form[action=?][method=?]", guest_book_entry_path(@guest_book_entry), "post" do
    end
  end
end
