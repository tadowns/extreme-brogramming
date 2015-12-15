require 'rails_helper'

describe "Create workout page", js: true do
  subject(:user) { create(:user) }
  subject(:exercise) { create(:exercise) }

  before(:each) do
    login_as(user, scope: :user)
  end

  it 'adds an exercise' do
    exercise
    visit new_workout_path

    select exercise.name, from: 'exercise'
    fill_in 'sets', with: '5'
    fill_in 'reps', with: '5'
    click_link 'Add exercise'

    within('table') do
      expect(page).to have_content(exercise.name)
    end
  end
end
