require 'rails_helper'
def already_follow?
  true if Following.find_by(followerid: user1.id, followedid: user2.id)
end

RSpec.describe Following, type: :model do
  let(:user1) do
    User.create(fullname: 'sergio cortes', username: 'test1', email: 'test11@gmail.com', password: '123456')
  end
  let(:user2) do
    User.create(fullname: 'carolina cortes', username: 'test2', email: 'test11@gmail.com', password: '123456')
  end

  describe 'validates Follow associations' do
    it 'validates if user is added to users followings' do
      Following.create(followerid: user1.id, followedid: user2.id)
      expect(already_follow?).to_not eq(true)
    end
  end

  describe 'associations' do
    it { should belong_to(:follower) }
  end
  describe 'associations' do
    it { should belong_to(:followed) }
  end
end
