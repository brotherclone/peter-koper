require 'rails_helper'

RSpec.describe "/tags", type: :request do

  let(:valid_attributes) {
    FactoryBot.attributes_for(:tag)
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for(:tag, name:nil)
  }

  describe "GET /index" do
    it "renders a successful response" do
      Tag.create! valid_attributes
      get tags_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      tag = Tag.create! valid_attributes
      get tag_url(tag)
      expect(response).to be_successful
    end
  end

end
