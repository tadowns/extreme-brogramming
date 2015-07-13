require 'rails_helper'

describe "Signup page", :type => :feature do
  it 'has a title "Sign up page"' do
    visit new_user_registration_path
    expect(page).to have_content("Sign up page")
  end

  it 'has a signup form' do
    visit new_user_registration_path
    expect(page).to have_selector("form")
  end

  describe 'when signing up with valid info' do
    it 'brings you to a dashboard page' do
      visit new_user_registration_path

      within("#new_user") do
        fill_in 'Email', :with => 'user@example.com'
        fill_in 'Password', :with => 'password'
        fill_in 'Password confirmation', :with => 'password'
      end

      click_button "Sign up"

      expect(page).to have_content("Dashboard")
    end
  end
end