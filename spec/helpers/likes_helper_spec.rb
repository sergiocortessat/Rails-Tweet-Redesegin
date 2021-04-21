require 'rails_helper'

feature 'User login the app' do
  let(:user) do
    User.create(fullname: 'sergio cortes', username: 'test1', email: 'test11@gmail.com', password: '123456')
  end

  scenario 'following users are shown in home page' do
    visit root_path
    expect(page).to have_text 'Log in'
  end
end
