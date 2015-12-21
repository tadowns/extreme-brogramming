# == Schema Information
#
# Table name: seshions
#
#  id         :integer          not null, primary key
#  workout_id :integer
#  user_id    :integer
#  date       :datetime
#
# Indexes
#
#  index_seshions_on_date        (date)
#  index_seshions_on_user_id     (user_id)
#  index_seshions_on_workout_id  (workout_id)
#

class Seshion < ActiveRecord::Base
  belongs_to :user
  belongs_to :workout
  has_many :lifts, dependent: :destroy

  def formatted_date
    self.date.try(:strftime, '%b %-d, %Y%l:%M %p')
  end

  class << self
    def build_from_workout(workout, user)
      new(
        user: user,
        workout: workout,
        date: DateTime.now,
        lifts: workout.workout_exercises.map { |we| Lift.build_from_workout_exercise(we) }
      )
    end
  end
end
