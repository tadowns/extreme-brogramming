# == Schema Information
#
# Table name: lifts
#
#  id          :integer          not null, primary key
#  seshion_id  :integer
#  exercise_id :integer
#
# Indexes
#
#  index_lifts_on_exercise_id  (exercise_id)
#  index_lifts_on_seshion_id   (seshion_id)
#

class Lift < ActiveRecord::Base
  belongs_to :session
  belongs_to :exercise
  has_many :sets, dependent: :destroy

  delegate :default_reps, to: :workout_exercise
end
