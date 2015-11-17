require 'rails_helper'

describe "User dashboard page" do
  subject(:user) { create(:user) }

  before(:each) do
    login_as(user, scope: :user)
  end

  it 'navigates to create workout type page', js: true do
    visit start_path(user)
    click_link 'add workout'
    expect(page).to have_content("Add a workout")
  end

  context 'when a workout type is available' do
    subject(:workout_type) { create(:workout_type, user: user) }

    it 'appears on the dashboard once' do
      workout_type
      visit start_path(user)
      expect(page).to have_content(workout_type.name, count: 1)
    end

    it 'navigates to create workout page' do
      workout_type
      visit start_path(user)
      click_link 'start workout'
      expect(page).to have_content("Workout: #{workout_type.name}")
    end

    context 'when a workout is started' do
      subject(:workout) { create(:workout, user: user, workout_type: workout_type, date: DateTime.now) }

      it 'is shown on the dashboard' do
        workout
        visit start_path(user)

        within '.recent-workouts' do
          expect(page).to have_content(workout.date)
        end
      end

      it 'shows a max of 10 recent workouts' do
        11.times { create(:workout, user: user, workout_type: workout_type ) }

        visit start_path(user)

        within '.recent-workouts tbody' do
          expect(page).to have_selector('tr', count: 10)
        end
      end
    end

    context 'when no workout types exist' do
      it 'should have an empty state message' do
        visit start_path(user)
        expect(page).to have_content("No workouts have been created");
      end

      it 'should not display the recent workout section' do
        visit start_path(user)
        expect(page).to_not have_content("Recent Workouts");
      end
    end
  end
end
