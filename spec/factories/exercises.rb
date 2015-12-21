# == Schema Information
#
# Table name: exercises
#
#  id   :integer          not null, primary key
#  name :string
#

FactoryGirl.define do
  factory :exercise do |e|
    e.sequence(:name) { |n| "exercise_#{n}" }
  end
end
