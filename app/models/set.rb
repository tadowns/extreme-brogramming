# == Schema Information
#
# Table name: workout_sets
#
#  id          :integer          not null, primary key
#  exercise_id :integer
#  reps        :integer
#  weight      :float
#  start_time  :datetime
#  end_time    :datetime
#
# Indexes
#
#  index_workout_sets_on_exercise_id  (exercise_id)
#

class Set < ActiveRecord::Base
  belongs_to :lift

  def completed?
    self.lift.default_reps == self.reps
  end
end
