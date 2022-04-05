require 'rails_helper'

RSpec.describe "/guest-book", type: :request do

  before do
    @memory = FactoryBot.create(:memory)
  end

  let(:valid_attributes) {
    FactoryBot.attributes_for(:guest_book_entry, memory_id: @memory.id)
  }

  let(:invalid_attributes) {
    { :title => nil, :body => nil }
  }

  describe "GET /index" do
    it "renders a successful response" do
      GuestBookEntry.create! valid_attributes
      get guest_book_entries_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      guest_book_entry = GuestBookEntry.create! valid_attributes
      get guest_book_entry_url(guest_book_entry)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_guest_book_entry_url
      expect(response).to be_successful
    end
  end



  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new GuestBookEntry" do
        expect {
          post guest_book_entries_url, params: { guest_book_entry: valid_attributes }
        }.to change(GuestBookEntry, :count).by(1)
      end

      it "redirects to the created guest_book_entry" do
        post guest_book_entries_url, params: { guest_book_entry: valid_attributes }
        expect(response).to redirect_to(guest_book_entries_path(:thank_you=> true, :memory_id=> @memory.id.to_s))
      end
    end

    context "with invalid parameters" do
      it "does not create a new GuestBookEntry" do
        expect {
          post guest_book_entries_url, params: { guest_book_entry: invalid_attributes }
        }.to change(GuestBookEntry, :count).by(0)
      end
    end
  end

end
