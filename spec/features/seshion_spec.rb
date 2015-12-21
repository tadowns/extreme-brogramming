require 'rails_helper'

describe 'Session feature' do
  subject(:user) { create(:user) }
  subject(:workout_with_workout_exercise) { create(:workout_with_workout_exercise, user: user) }
  subject(:workout_exercise) { workout_with_workout_exercise.workout_exercises.first }
  subject(:seshion) do
    Seshion.build_from_workout(workout_with_workout_exercise, user).tap { |s| s.save! }
  end

  before(:each) do
    login_as(user, scope: :user)
  end

  context 'from the dashboard' do
    it "has no 'start workout' button if there are no workouts" do
      visit start_path

      within '.workouts table tbody' do
        expect(page).to_not have_link 'start workout'
      end
    end

    it 'has a start workout button given a workout_exercise' do
      workout_with_workout_exercise
      visit start_path
      expect(page).to have_link 'start workout', count: 1
    end

    it 'starts a seshion when clicking a workout' do
      workout_with_workout_exercise
      visit start_path
      click_link 'start workout'
      expect(page).to have_selector "h1", text: "Workout: #{seshion.workout.name}"
    end
  end

  context 'after starting a seshion' do
    it 'should show up on the dashboard' do
      seshion
      visit start_path

      within '.recent-seshions' do
        expect(page).to have_content seshion.formatted_date
      end
    end

    context 'on the seshion page' do
      it 'should list the associated workout exercises' do
        seshion
        visit seshions_path(seshion)

        within '.seshion-exercises' do
          expect(page).to have_content seshion.lifts.first.name
        end
      end
    end
  end
end
