# == Schema Information
#
# Table name: workout_exercises
#
#  id          :integer          not null, primary key
#  workout_id  :integer
#  exercise_id :integer
#  target_sets :integer
#  target_reps :integer
#
# Indexes
#
#  index_workout_exercises_on_exercise_id  (exercise_id)
#  index_workout_exercises_on_workout_id   (workout_id)
#

FactoryGirl.define do
  factory :workout_exercise do |w|
    target_sets 1
    target_reps 1
    workout
    exercise
  end
end
