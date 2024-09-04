require 'rails_helper'

RSpec.describe "Celebration", type: :request do
  it "ensures the celebration invite is available" do
    get "/celebration"
    expect(response).to render_template(:index)
  end
end