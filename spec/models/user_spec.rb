require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user1) do
    User.new(fullname: 'sergio cortes', username: 'test1', email: 'test11@gmail.com', password: '123456')
  end
  let(:user2) do
    User.new(fullname: 'carolina cortes', username: 'test2', email: 'test12@gmail.com', password: '123456')
  end
  describe 'validates user attributes' do
    it 'validates if the user is valid' do
      expect(user1.valid?).to eql(true)
    end
    it 'validates if the username is present' do
      user1.username = ' '
      expect(user1.valid?).not_to eql(true)
    end
    it 'validates if the fullname is present' do
      user1.fullname = ' '
      expect(user1.valid?).not_to eql(true)
    end
    it 'validates if the name is not too long' do
      user1.fullname = 'a' * 61
      expect(user1.valid?).not_to eql(false)
    end
    it 'validates if the usernames are unique' do
      duplicate_user = user1.dup
      user1.save
      expect(duplicate_user.valid?).not_to eql(true)
    end
  end

  describe 'associations' do
    it { should have_many(:followed) }
  end
  describe 'associations' do
    it { should have_many(:followers) }
  end
  describe 'associations' do
    it { should have_many(:likes) }
  end
  describe 'associations' do
    it { should have_many(:opinions) }
  end
end
