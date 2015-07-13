require 'rails_helper'

describe "User dashboard page", :type => :feature do
  subject(:user) { create(:user) }

  before(:each) do
    login_as(user, :scope => :user)
  end

  it 'has the title "Dashboard"' do
    visit dashboard_path(user)
    expect(page).to have_content("Dashboard")
  end

  it 'doesnt have the link for "signup"' do
    visit dashboard_path(user)
    expect(page).to_not have_content("signup")
  end
end