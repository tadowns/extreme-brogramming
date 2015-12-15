require 'rails_helper'

describe "Home page" do
  it "has a link to signup page" do
    visit root_path
    expect(page).to have_link("signup")
  end

  it "navigates to signup page when clicking signup" do
    visit root_path
    click_link "signup"
    expect(current_path).to eq(new_user_registration_path)
  end
end
