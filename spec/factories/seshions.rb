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

FactoryGirl.define do
  factory :seshion do |s|
    user
    workout
  end
end
