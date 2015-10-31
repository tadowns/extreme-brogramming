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
      subject(:workout) { create(:workout, user: user, date: DateTime.now) }

      it 'is shown on the dashboard' do
        workout
        visit start_path(user)

        within '.recent-workouts' do
          expect(page).to have_content(workout.date)
        end
      end

      it 'shows a max of 10 recent workouts' do
        11.times { create(:workout, user: user) }

        visit start_path(user)

        within '.recent-workouts tbody' do
          expect(page).to have_selector('tr', count: 10)
        end
      end
    end
  end
end
