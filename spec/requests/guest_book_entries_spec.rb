require 'rails_helper'

RSpec.describe "/guest-book", type: :request do

  let(:valid_attributes) {
    FactoryBot.attributes_for(:guest_book_entry)
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

  describe "GET /edit" do
    it "render a successful response" do
      guest_book_entry = GuestBookEntry.create! valid_attributes
      get edit_guest_book_entry_url(guest_book_entry)
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
        expect(response).to redirect_to(guest_book_entry_url(GuestBookEntry.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new GuestBookEntry" do
        expect {
          post guest_book_entries_url, params: { guest_book_entry: invalid_attributes }
        }.to change(GuestBookEntry, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post guest_book_entries_url, params: { guest_book_entry: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        FactoryBot.attributes_for(:guest_book_entry, body: "Oh one more thing")
      }
      it "updates the requested guest_book_entry" do
        guest_book_entry = GuestBookEntry.create! valid_attributes
        patch guest_book_entry_url(guest_book_entry), params: { guest_book_entry: new_attributes }
        guest_book_entry.reload
      end

      it "redirects to the guest_book_entry" do
        guest_book_entry = GuestBookEntry.create! valid_attributes
        patch guest_book_entry_url(guest_book_entry), params: { guest_book_entry: new_attributes }
        guest_book_entry.reload
        expect(response).to redirect_to(guest_book_entry_url(guest_book_entry))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        guest_book_entry = GuestBookEntry.create! valid_attributes
        patch guest_book_entry_url(guest_book_entry), params: { guest_book_entry: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested guest_book_entry" do
      guest_book_entry = GuestBookEntry.create! valid_attributes
      expect {
        delete guest_book_entry_url(guest_book_entry)
      }.to change(GuestBookEntry, :count).by(-1)
    end

    it "redirects to the guest_book_entries list" do
      guest_book_entry = GuestBookEntry.create! valid_attributes
      delete guest_book_entry_url(guest_book_entry)
      expect(response).to redirect_to(guest_book_entries_url)
    end
  end
end
