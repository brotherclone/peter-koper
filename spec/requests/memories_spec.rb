 require 'rails_helper'

RSpec.describe "/memories", type: :request do
  
  # Memory. As you add validations to Memory, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
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

  describe "GET /edit" do
    it "render a successful response" do
      memory = Memory.create! valid_attributes
      get edit_memory_url(memory)
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

      it "redirects to the created memory" do
        post memories_url, params: { memory: valid_attributes }
        expect(response).to redirect_to(memory_url(Memory.last))
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
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested memory" do
        memory = Memory.create! valid_attributes
        patch memory_url(memory), params: { memory: new_attributes }
        memory.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the memory" do
        memory = Memory.create! valid_attributes
        patch memory_url(memory), params: { memory: new_attributes }
        memory.reload
        expect(response).to redirect_to(memory_url(memory))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        memory = Memory.create! valid_attributes
        patch memory_url(memory), params: { memory: invalid_attributes }
        expect(response).to be_successful
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