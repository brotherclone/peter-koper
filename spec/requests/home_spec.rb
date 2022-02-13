require 'rails_helper'

RSpec.describe "Home", type: :request do
  it "ensures the home page is available" do
    get "/home"
    expect(response).to render_template(:index)
  end
end
