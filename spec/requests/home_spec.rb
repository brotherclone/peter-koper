require 'rails_helper'

RSpec.describe "Home", type: :request do
  it "ensures home is available" do
    get "/home"
    expect(response).to render_template(:index)
  end
  it "ensures home is available as the root view" do
    get "/"
    expect(response).to render_template(:index)
  end

end
