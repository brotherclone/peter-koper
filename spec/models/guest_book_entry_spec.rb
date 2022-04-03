require 'rails_helper'

RSpec.describe GuestBookEntry, type: :model do

  describe 'Factory'do
    it{ expect(build(:guest_book_entry)).to be_valid }
  end

  describe 'Must have a title' do
    it { should validate_presence_of(:title) }
  end

  describe 'Must have a body' do
    it { should validate_presence_of(:body) }
  end

  it 'belongs to a memory' do
    should belong_to(:memory)
  end

end
