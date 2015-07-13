require 'rails_helper'

describe "Home page", :type => :feature do
  it "has a title, Welcome!" do
    visit root_path
    expect(page).to have_content 'Welcome!'
  end

  it "has a link to signup page" do
    visit root_path
    expect(page).to have_link("signup")
  end

  it "navigates to signup page when clicking signup" do
    visit root_path
    click_link "signup"
    expect(page).to have_content("Sign up page")
  end
end