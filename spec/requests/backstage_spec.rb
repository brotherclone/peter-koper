require 'rails_helper'

RSpec.describe "Back Stage", type: :request do
  it "ensures back stage is available" do
    get "/back-stage"
    expect(response).to render_template(:index)
  end
  it "ensures back stage has a style guide response" do
    get "/back-stage/style-guide"
    expect(response).to render_template(:style)
  end
  it "ensures back stage has a dev info area" do
    get "/back-stage/dev-info"
    expect(response).to render_template(:dev)
  end
end
