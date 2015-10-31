require 'rails_helper'

describe "Workout type page", type: :feature, js: true do
  subject(:user) { create(:user) }

  before(:each) do
    login_as(user, scope: :user)
  end

  it 'adds an exercise' do
    visit new_workout_type_path

    select 'Deadlift', from: 'workout'
    fill_in 'sets', with: '5'
    fill_in 'reps', with: '5'
    click_link 'Add exercise'

    within('table') do
      expect(page).to have_content('Deadlift')
    end
  end
end
