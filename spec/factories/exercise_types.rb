FactoryGirl.define do
  factory :exercise_type do |e|
    e.sequence(:name) { |n| "exercise_#{n}" }
  end
end
