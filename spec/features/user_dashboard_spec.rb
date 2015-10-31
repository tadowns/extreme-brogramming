require 'rails_helper'

describe "User dashboard page", :type => :feature do
  subject(:user) { create(:user) }

  before(:each) do
    login_as(user, scope: :user)
  end

  it 'has the title "Start a Workout"' do
    visit start_path(user)
    expect(page).to have_content("Start a Workout")
  end

  it 'doesnt have the link for "signup"' do
    visit start_path(user)
    expect(page).to_not have_content("signup")
  end

  context 'when react is needed', js: true do
    it 'navigates to create workout type page' do
      visit start_path(user)
      click_link 'add workout'
      expect(page).to have_content("Add a workout")
    end
  end
end
