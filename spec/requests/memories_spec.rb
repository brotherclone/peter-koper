 require 'rails_helper'

RSpec.describe "/memories", type: :request do
  
  # Memory. As you add validations to Memory, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryBot.attributes_for(:memory)
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for(:memory, occurrence:nil)
  }

  describe "GET /index" do
    it "renders a successful response" do
      Memory.create! valid_attributes
      get memories_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      memory = Memory.create! valid_attributes
      get memory_url(memory)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_memory_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Memory" do
        expect {
          post memories_url, params: { memory: valid_attributes }
        }.to change(Memory, :count).by(1)
      end

      it "redirects to the thank you page" do
        post memories_url, params: { memory: valid_attributes }
        expect(response).to redirect_to(thanks_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Memory" do
        expect {
          post memories_url, params: { memory: invalid_attributes }
        }.to change(Memory, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post memories_url, params: { memory: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        FactoryBot.attributes_for(:memory, title: "No that's not how it happened.")
      }

      it "updates the requested memory" do
        memory = Memory.create! valid_attributes
        patch memory_url(memory), params: { memory: new_attributes }
        memory.reload
      end

      it "redirects to the memory" do
        memory = Memory.create! valid_attributes
        patch memory_url(memory), params: { memory: new_attributes }
        memory.reload
        expect(response).to redirect_to(memory_url(memory))
      end
    end

  end

  describe "DELETE /destroy" do
    it "destroys the requested memory" do
      memory = Memory.create! valid_attributes
      expect {
        delete memory_url(memory)
      }.to change(Memory, :count).by(-1)
    end

    it "redirects to the memories list" do
      memory = Memory.create! valid_attributes
      delete memory_url(memory)
      expect(response).to redirect_to(memories_url)
    end
  end
end
