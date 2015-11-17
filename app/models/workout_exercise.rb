# == Schema Information
#
# Table name: workout_exercises
#
#  id               :integer          not null, primary key
#  workout_type_id  :integer
#  exercise_type_id :integer
#  sets             :integer
#  reps             :integer
#
# Indexes
#
#  index_workout_exercises_on_exercise_type_id  (exercise_type_id)
#  index_workout_exercises_on_workout_type_id   (workout_type_id)
#

class WorkoutExercise < ActiveRecord::Base
  belongs_to :workout_type, inverse_of: :workout_exercises
  belongs_to :exercise_type

  delegate :name, to: :exercise_type, prefix: true
  delegate :name, to: :workout_type, prefix: true

  validates_presence_of :sets, :reps, :workout_type, :exercise_type
  validates_numericality_of :sets, :reps, greater_than: 0
end
