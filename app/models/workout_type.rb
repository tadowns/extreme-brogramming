# == Schema Information
#
# Table name: workout_types
#
#  id      :integer          not null, primary key
#  name    :string
#  user_id :integer
#
# Indexes
#
#  index_workout_types_on_user_id  (user_id)
#

class WorkoutType < ActiveRecord::Base
  has_many :workout_exercises, dependent: :destroy
  has_many :exercise_types, through: :workout_exercises
  belongs_to :user

  accepts_nested_attributes_for :workout_exercises, allow_destroy: true

  validates_presence_of :user_id
end
