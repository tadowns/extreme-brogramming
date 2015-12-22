require 'rails_helper'

describe 'Lifts and working sets feature' do
  subject(:user) { create(:user) }
  subject(:workout_with_workout_exercises) { create(:workout_with_workout_exercises, user: user) }
  subject(:workout_exercise) { workout_with_workout_exercise.workout_exercises.first }
  subject(:seshion) do
    Seshion.build_from_workout(workout_with_workout_exercises, user).tap { |s| s.save! }
  end

  before(:each) do
    login_as(user, scope: :user)
  end

  context "On seshion page" do
    it "displays lifts" do
      visit seshions_path(seshion)
      seshion.lifts.each do |lift|
        expect(page).to have_content lift.name
      end
    end

    it "navigates to lift page when clicking a lift" do
      visit seshions_path(seshion)
      click_link seshion.lifts.first.name
      expect(current_path).to eq(seshion_lifts_path(seshion, seshion.lifts.first))
    end
  end

  context "On lift page", js: true do
    let(:lift) { seshion.lifts.first }

    before(:each) do
      visit seshion_lifts_path(seshion, lift)
    end

    it "displays the name of the lift" do
      expect(page).to have_selector "h1", text: lift.name
    end
  end
end
