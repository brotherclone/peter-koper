require 'rails_helper'

RSpec.describe MemoryComment, type: :model do

  describe 'Factory'do
    it{ expect(build(:memory_comment)).to be_valid }
  end

  it 'belongs to a memory' do
    should belong_to(:memory)
  end

  describe 'Must have an author name' do
    it { should validate_presence_of(:author_name) }
  end

  describe 'Must have an author email' do
    it { should validate_presence_of(:author_email) }
  end

  describe 'Must have a body' do
    it { should validate_presence_of(:body) }
  end

end
