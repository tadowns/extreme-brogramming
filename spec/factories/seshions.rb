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

FactoryGirl.define do
  factory :seshion do |s|
    user
    workout
  end
end
