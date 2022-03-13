require 'rails_helper'

RSpec.describe "/sub_categories", type: :request do

  before do
    @category = FactoryBot.create(:category)
  end


  describe "GET /index" do
    it "renders a successful response" do
      FactoryBot.attributes_for(:sub_category, category_id: @category.id)
      get category_sub_categories_url(@category)
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      FactoryBot.attributes_for(:sub_category, category_id: @category.id)
      get category_sub_categories_path(@category)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_category_sub_category_path(@category)
      expect(response).to be_successful
    end
  end

  # ToDo: rewrite the rest for nested
end
