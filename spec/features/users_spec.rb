require 'rails_helper'

feature 'User login the app' do
  let(:user) do
    User.create(fullname: 'sergio cortes', username: 'test1', email: 'test11@gmail.com', password: '123456')
  end

  scenario 'following users are shown in home page' do
    visit root_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'
    expect(page).to have_text @followed_count
  end

  scenario 'followers are shown in home page' do
    visit root_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'
    expect(page).to have_text @followers_count
  end
end
