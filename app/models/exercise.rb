# == Schema Information
#
# Table name: exercises
#
#  id                  :integer          not null, primary key
#  workout_id          :integer
#  workout_exercise_id :integer
#
# Indexes
#
#  index_exercises_on_workout_exercise_id  (workout_exercise_id)
#  index_exercises_on_workout_id           (workout_id)
#

class Exercise < ActiveRecord::Base
  belongs_to :workout
  belongs_to :workout_exercise
  has_many :workout_sets, dependent: :destroy
end
