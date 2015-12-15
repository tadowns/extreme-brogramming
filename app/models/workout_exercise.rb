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

class WorkoutExercise < ActiveRecord::Base
  belongs_to :workout, inverse_of: :workout_exercises
  belongs_to :exercise

  validates_presence_of :target_sets, :target_reps, :workout, :exercise
  validates_numericality_of :target_sets, :target_reps, greater_than: 0
end
