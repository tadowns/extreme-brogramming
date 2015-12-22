# == Schema Information
#
# Table name: workout_exercises
#
#  id          :integer          not null, primary key
#  workout_id  :integer
#  target_sets :integer
#  target_reps :integer
#  name        :string
#
# Indexes
#
#  index_workout_exercises_on_workout_id  (workout_id)
#

FactoryGirl.define do
  factory :workout_exercise do |we|
    we.sequence(:name) { |n| "exercise_#{n}" }
    target_sets 1
    target_reps 1
    workout
  end
end
