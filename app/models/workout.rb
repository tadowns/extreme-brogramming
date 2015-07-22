# == Schema Information
#
# Table name: workouts
#
#  id              :integer          not null, primary key
#  workout_type_id :integer
#  user_id         :integer
#  date            :datetime
#
# Indexes
#
#  index_workouts_on_date             (date)
#  index_workouts_on_user_id          (user_id)
#  index_workouts_on_workout_type_id  (workout_type_id)
#

class Workout < ActiveRecord::Base
  belongs_to :workout_type
  has_many :exercises, dependent: :destroy
end
