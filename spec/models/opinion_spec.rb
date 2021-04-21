require 'rails_helper'

RSpec.describe Opinion, type: :model do
  let(:user1) do
    User.create(fullname: 'sergio cortes', username: 'test1', email: 'test11@gmail.com', password: '123456')
  end

  let(:opinion1) { Opinion.create(author_id: user1.id, text: 'tweet1') }

  describe 'validates user attributes' do
    it 'validates if the opinion is valid' do
      expect(opinion1.valid?).to eql(true)
    end
    it 'validates if the text is present' do
      opinion1.text = ' '
      expect(opinion1.valid?).not_to eql(true)
    end
    it 'validates if the name is not too long' do
      opinion1.text = 'a' * 281
      expect(opinion1.valid?).not_to eql(true)
    end
  end
end
