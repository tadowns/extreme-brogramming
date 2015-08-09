# == Schema Information
#
# Table name: workout_types
#
#  id   :integer          not null, primary key
#  name :string
#

class WorkoutType < ActiveRecord::Base
  has_many :workout_exercises, dependent: :destroy
  has_many :exercise_types, through: :workout_exercises

  accepts_nested_attributes_for :workout_exercises, allow_destroy: true
end
