require 'rails_helper'

describe "Workout type page", type: :feature, js: true do
  subject(:user) { create(:user) }
  subject(:exercise_type) { create(:exercise_type) }

  before(:each) do
    login_as(user, scope: :user)
  end

  it 'adds an exercise' do
    exercise_type
    visit new_workout_type_path

    select exercise_type.name, from: 'exercise'
    fill_in 'sets', with: '5'
    fill_in 'reps', with: '5'
    click_link 'Add exercise'

    within('table') do
      expect(page).to have_content(exercise_type.name)
    end
  end
end
