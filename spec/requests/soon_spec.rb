require 'rails_helper'

RSpec.describe "Soon", type: :request do
  it "ensures the coming soon is available" do
    get "/soon"
    expect(response).to render_template(:index)
  end
end
