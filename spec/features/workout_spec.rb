require 'rails_helper'

describe 'Workout feature' do
  subject(:user) { create(:user) }
  subject(:workout_type_with_workout_exercise) { create(:workout_type_with_workout_exercise, user: user) }
  subject(:workout_exercise) { workout_type_with_workout_exercise.workout_exercises.first }
  subject(:workout) { create(:workout, workout_type: workout_type_with_workout_exercise, user: user ) }

  before(:each) do
    login_as(user, scope: :user)
  end

  context 'from the dashboard' do
    it "has no 'start workout' button if there are no workout_types" do
      visit start_path

      within '.workouts table tbody' do
        expect(page).to_not have_link 'start workout'
      end
    end

    it 'has a start workout button given a workout_exercise' do
      workout_type_with_workout_exercise
      visit start_path
      expect(page).to have_link 'start workout', count: 1
    end

    it 'starts a workout when clicking a workout type' do
      workout_type_with_workout_exercise
      visit start_path
      click_link 'start workout'
      expect(page).to have_selector "h1", text: "Workout: #{workout_exercise.workout_type_name}"
    end
  end

  context 'after starting a workout' do
    it 'it shows up on the dashboard' do
      workout
      visit start_path

      within '.recent-workouts' do
        expect(page).to have_content workout.date
      end
    end
  end
end
