# == Schema Information
#
# Table name: workouts
#
#  id      :integer          not null, primary key
#  name    :string
#  user_id :integer
#
# Indexes
#
#  index_workouts_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :workout do |w|
    w.sequence(:name) { |n| "workout_#{n}" }
    user

    factory :workout_with_workout_exercise do
      after(:create) do |workout|
        create(:workout_exercise, workout: workout)
      end
    end

    factory :workout_with_workout_exercises do
      after(:create) do |workout|
        3.times do
          create(:workout_exercise, workout: workout)
        end
      end
    end
  end
end
