# == Schema Information
#
# Table name: working_sets
#
#  id         :integer          not null, primary key
#  lift_id    :integer
#  reps       :integer
#  weight     :float
#  start_time :datetime
#  end_time   :datetime
#
# Indexes
#
#  index_working_sets_on_lift_id  (lift_id)
#

class WorkingSet < ActiveRecord::Base
  belongs_to :lift

  def completed?
    self.lift.default_reps == self.reps
  end
end
