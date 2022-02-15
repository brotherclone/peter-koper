require "rails_helper"

RSpec.describe GuestBookEntriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/guest_book_entries").to route_to("guest_book_entries#index")
    end

    it "routes to #new" do
      expect(get: "/guest_book_entries/new").to route_to("guest_book_entries#new")
    end

    it "routes to #show" do
      expect(get: "/guest_book_entries/1").to route_to("guest_book_entries#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/guest_book_entries/1/edit").to route_to("guest_book_entries#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/guest_book_entries").to route_to("guest_book_entries#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/guest_book_entries/1").to route_to("guest_book_entries#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/guest_book_entries/1").to route_to("guest_book_entries#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/guest_book_entries/1").to route_to("guest_book_entries#destroy", id: "1")
    end
  end
end
