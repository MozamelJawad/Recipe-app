require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before :all do
    @user = User.create(name: 'new', email: 'new@gmail.com', password: '123123')
  end

  describe 'Log in page' do
    it 'should have a Log in page' do
      visit new_user_session_path
      expect(page).to have_content('Log in')
    end

    it 'should have a form for log in' do
      visit new_user_session_path
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
    end

    it 'should log in with credentials' do
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      expect(current_path).to match('/')
    end

    it 'should have a sign up link' do
      visit new_user_session_path
      expect(page).to have_content('Sign up')
    end

    it 'have a forgot password link' do
      visit new_user_session_path
      expect(page).to have_content('Forgot your password')
    end

    it 'redirect to forgot password page' do
      visit new_user_session_path
      click_link 'Forgot your password?'
      expect(current_path).to match(new_user_password_path)
    end

    it 'have form text' do
      visit new_user_session_path
      expect(page).to have_content('Remember me')
    end

    it 'should have a forgot password page' do
      visit new_user_password_path
      expect(page).to have_content('Log in')
      expect(page).to have_content('Sign up')
      expect(page).to have_content('Forgot your password')
      expect(page).to have_content('Email')
    end

    it 'should have a sign up page' do
      visit new_user_registration_path
      expect(page).to have_content('Sign up')
      expect(page).to have_content('Log in')
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
    end
  end
end
