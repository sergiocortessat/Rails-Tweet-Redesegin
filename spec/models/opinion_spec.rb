require 'rails_helper'

RSpec.describe Opinion, type: :model do
  let(:user1) do
    User.create(fullname: 'sergio cortes', username: 'test1', email: 'test11@gmail.com', password: '123456')
  end

  let(:opinion1) { Opinion.create(author_id: user1.id, text: 'testing this') }

  describe 'validates user full name attributes' do
    it 'validates if the opinion is valid' do
      expect(opinion1.author.fullname).to eq('sergio cortes')
    end
    it 'validates username attributes' do
      opinion1.text = ' '
      expect(opinion1.author.username).to eq('test1')
    end
    it 'validates if the name is not too long' do
      opinion1.text = 'a' * 281
      expect(opinion1.valid?).not_to eq(true)
    end
  end
  describe 'associations' do
    it { should belong_to(:author) }
  end
  describe 'associations' do
    it { should have_many(:likes) }
  end
end
