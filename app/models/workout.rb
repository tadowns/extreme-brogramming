# == Schema Information
#
# Table name: workouts
#
#  id      :integer          not null, primary key
#  name    :string
#  user_id :integer
#
# Indexes
#
#  index_workouts_on_user_id  (user_id)
#

class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :workout_exercises, inverse_of: :workout, dependent: :destroy
  has_many :exercises, through: :workout_exercises
  has_many :seshions, dependent: :destroy

  accepts_nested_attributes_for :workout_exercises, allow_destroy: true

  validates_presence_of :user_id

  class << self
    def allowed_params
      [
        :name,
        workout_exercises_attributes: [
          :exercise_id,
          :target_sets,
          :target_reps
        ]
      ]
    end
  end

  def to_builder
    Jbuilder.new do |workout|
      workout.(self, :id, :name)
    end
  end
end
