# == Schema Information
#
# Table name: lifts
#
#  id                  :integer          not null, primary key
#  seshion_id          :integer
#  workout_exercise_id :integer
#
# Indexes
#
#  index_lifts_on_seshion_id           (seshion_id)
#  index_lifts_on_workout_exercise_id  (workout_exercise_id)
#

class Lift < ActiveRecord::Base
  belongs_to :session
  belongs_to :workout_exercise
  has_many :working_sets, dependent: :destroy

  delegate :default_reps, to: :workout_exercise
  delegate :name, to: :workout_exercise

  class << self
    def build_from_workout_exercise(workout_exercise)
      new(workout_exercise: workout_exercise)
    end
  end
end
