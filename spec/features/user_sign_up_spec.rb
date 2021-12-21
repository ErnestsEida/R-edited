require 'rails_helper'

RSpec.describe 'User sign up' do
  it 'is not successful because user does not provide equal passwords' do
    visit '/'

    within 'nav.navbar' do
      click_on "Sign Up"
    end

    within '.card.auth-card' do
      fill_in "Email", with: 'draknight@example.com'
      fill_in "Username", with: 'draknight'
      fill_in 'Password', with: "password123"
      fill_in 'Password confirmation', with: "password456"
      click_button "Sign up"
    end

    within '.card.auth-card' do
      expect(page).to have_content("Password confirmation doesn't match Password")
    end

    expect(User.where(email: 'draknight@example.com')).to_not be_exist
  end

  context 'Missing input data' do
    it 'missing email' do
      visit '/session/sign_up'

      within '.card.auth-card' do
        fill_in "Username", with: 'userman'
        fill_in "Password", with: 'p@ssword'
        fill_in "Password confirmation", with: 'p@ssword'
        click_button "Sign up"
      end

      expect(page).to have_content("Email is invalid")
    end

    it 'missing username' do
      visit '/session/sign_up'

      within '.card.auth-card' do
        fill_in "Email", with: "poggers@email.com"
        fill_in "Password", with: 'p@ssword'
        fill_in "Password confirmation", with: 'p@ssword'
        click_button "Sign up"
      end

      expect(page).to have_content("Username can't be blank")

    end

    it 'missing password' do
      visit '/session/sign_up'

      within '.card.auth-card' do
        fill_in "Email", with: "poggers@email.com"
        fill_in "Username", with: "poggers"
        click_button "Sign up"
      end

      expect(page).to have_content("Password can't be blank")

    end
  end
end
