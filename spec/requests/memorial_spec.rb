require 'rails_helper'

RSpec.describe "Memorial", type: :request do
  it "ensures the memorial invite is available" do
    get "/memorial"
    expect(response).to render_template(:index)
  end
end