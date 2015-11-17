require 'rails_helper'

describe "Signup page" do
  context 'when signing up with valid info' do
    it 'brings you to a dashboard page' do
      visit new_user_registration_path

      within("#new_user") do
        fill_in 'Email', :with => 'user@example.com'
        fill_in 'Password', :with => 'password'
        fill_in 'Password confirmation', :with => 'password'
      end

      click_button "Sign up"

      expect(current_path).to eq(user_root_path)
    end
  end
end
