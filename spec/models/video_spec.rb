require 'rails_helper'

RSpec.describe Video, type: :model do

  describe 'Factory'do
    it{ expect(build(:video)).to be_valid }
  end

  describe 'Must have a video id' do
    it { should validate_presence_of(:video_id) }
  end

  describe 'Must have a url' do
    it { should validate_presence_of(:url) }
  end

  describe 'Must have a video service' do
    it { should validate_presence_of(:video_service) }
  end

end
