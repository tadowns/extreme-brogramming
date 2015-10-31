FactoryGirl.define do
  factory :workout_type do |w|
    w.sequence(:name) { |n| "workout_type_#{n}" }
    user
  end
end
