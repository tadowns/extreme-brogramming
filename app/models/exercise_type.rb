# == Schema Information
#
# Table name: exercise_types
#
#  id   :integer          not null, primary key
#  name :string
#

class ExerciseType < ActiveRecord::Base
  has_many :workout_exercises, dependent: :destroy
  has_many :workout_types, through: :workout_exercises

  validates_uniqueness_of :name
end
