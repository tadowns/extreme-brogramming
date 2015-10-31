FactoryGirl.define do
  factory :exercise_type do |e|
    e.sequence(:name) { |n| "exercise_type_#{n}" }
  end
end
