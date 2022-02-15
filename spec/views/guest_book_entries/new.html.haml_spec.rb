require 'rails_helper'

RSpec.describe "guest_book_entries/new", type: :view do
  before(:each) do
    assign(:guest_book_entry, GuestBookEntry.new())
  end

  it "renders new guest_book_entry form" do
    render

    assert_select "form[action=?][method=?]", guest_book_entries_path, "post" do
    end
  end
end
