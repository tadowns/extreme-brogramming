require 'rails_helper'

describe "User dashboard page" do
  subject(:user) { create(:user) }

  before(:each) do
    login_as(user, scope: :user)
  end

  it 'navigates to create workout page', js: true do
    visit start_path(user)
    click_link 'add workout'
    expect(page).to have_content("Add a workout")
  end

  context 'when a workout is available' do
    subject(:workout) { create(:workout, user: user) }

    it 'appears on the dashboard once' do
      workout
      visit start_path(user)
      expect(page).to have_content(workout.name, count: 1)
    end

    it 'navigates to create workout page' do
      workout
      visit start_path(user)
      click_link 'start workout'
      expect(page).to have_content("Workout: #{workout.name}")
    end

    context 'when a session is started' do
      subject(:seshion) { create(:seshion, user: user, workout: workout, date: DateTime.now) }

      it 'is shown on the dashboard' do
        seshion
        visit start_path(user)

        within '.recent-seshions' do
          expect(page).to have_content(seshion.formatted_date)
        end
      end

      it 'shows a max of 10 recent sessions' do
        11.times { create(:seshion, user: user, workout: workout ) }

        visit start_path(user)

        within '.recent-seshions tbody' do
          expect(page).to have_selector('tr', count: 10)
        end
      end

      it 'links to the session' do
        seshion
        visit start_path(user)

        within '.recent-seshions' do
          expect(page).to have_link(seshion.formatted_date, href: seshions_path(seshion))
        end
      end
    end

    context 'when no sessions exist' do
      it 'should not display the recent sessions section' do
        visit start_path(user)
        expect(page).to_not have_content("Recent Sessions");
      end
    end
  end
end
