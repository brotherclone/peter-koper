require 'rails_helper'

RSpec.describe "/memory_comment_comments", type: :request do


  before do
    @memory = FactoryBot.create(:memory)
  end


  let(:valid_attributes) {
    FactoryBot.attributes_for(:memory_comment, memory_id: @memory.id)
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for(:memory_comment, author_name:nil)
  }

  describe "GET /index" do
    it "renders a successful response" do
      MemoryComment.create! valid_attributes
      get memory_comments_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      memory_comment = MemoryComment.create! valid_attributes
      get memory_comment_url(memory_comment)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_memory_comment_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new MemoryComment" do
        expect {
          post memory_comments_url, params: { memory_comment: valid_attributes }
        }.to change(MemoryComment, :count).by(1)
      end

      it "redirects to the created memory comment" do
        post memory_comments_url, params: { memory_comment: valid_attributes }
        expect(response).to redirect_to(memory_comment_url(MemoryComment.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new MemoryComment" do
        expect {
          post memory_comments_url, params: { memory_comment: invalid_attributes }
        }.to change(MemoryComment, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post memory_comments_url, params: { memory_comment: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        FactoryBot.attributes_for(:memory_comment, title: "No that's not how it happened.")
      }

      it "updates the requested memory_comment" do
        memory_comment = MemoryComment.create! valid_attributes
        patch memory_comment_url(memory_comment), params: { memory_comment: new_attributes }
        memory_comment.reload
      end

      it "redirects to the memory_comment" do
        memory_comment = MemoryComment.create! valid_attributes
        patch memory_comment_url(memory_comment), params: { memory_comment: new_attributes }
        memory_comment.reload
        expect(response).to redirect_to(memory_comment_url(memory_comment))
      end
    end

  end

  describe "DELETE /destroy" do
    it "destroys the requested memory_comment" do
      memory_comment = MemoryComment.create! valid_attributes
      expect {
        delete memory_comment_url(memory_comment)
      }.to change(MemoryComment, :count).by(-1)
    end

    it "redirects to the memory_comment_comments list" do
      memory_comment = MemoryComment.create! valid_attributes
      delete memory_comment_url(memory_comment)
      expect(response).to redirect_to(memory_comments_url)
    end
  end
end
