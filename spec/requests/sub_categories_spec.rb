require 'rails_helper'

RSpec.describe "/sub_categories", type: :request do

  # SubCategory. As you add validations to SubCategory, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryBot.attributes_for(:sub_category)
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for(:sub_category, occurrence:nil)
  }

  describe "GET /index" do
    it "renders a successful response" do
      SubCategory.create! valid_attributes
      get sub_categories_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      sub_category = SubCategory.create! valid_attributes
      get sub_category_url(sub_category)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_sub_category_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new SubCategory" do
        expect {
          post sub_categories_url, params: { sub_category: valid_attributes }
        }.to change(SubCategory, :count).by(1)
      end

      it "redirects to the created sub_category" do
        post sub_categories_url, params: { sub_category: valid_attributes }
        expect(response).to redirect_to(sub_category_url(SubCategory.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new SubCategory" do
        expect {
          post sub_categories_url, params: { sub_category: invalid_attributes }
        }.to change(SubCategory, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post sub_categories_url, params: { sub_category: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        FactoryBot.attributes_for(:sub_category, title: "No that's not how it happened.")
      }

      it "updates the requested sub_category" do
        sub_category = SubCategory.create! valid_attributes
        patch sub_category_url(sub_category), params: { sub_category: new_attributes }
        sub_category.reload
      end

      it "redirects to the sub_category" do
        sub_category = SubCategory.create! valid_attributes
        patch sub_category_url(sub_category), params: { sub_category: new_attributes }
        sub_category.reload
        expect(response).to redirect_to(sub_category_url(sub_category))
      end
    end

  end

  describe "DELETE /destroy" do
    it "destroys the requested sub_category" do
      sub_category = SubCategory.create! valid_attributes
      expect {
        delete sub_category_url(sub_category)
      }.to change(SubCategory, :count).by(-1)
    end

    it "redirects to the sub_categories list" do
      sub_category = SubCategory.create! valid_attributes
      delete sub_category_url(sub_category)
      expect(response).to redirect_to(sub_categories_url)
    end
  end
end
