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
end
