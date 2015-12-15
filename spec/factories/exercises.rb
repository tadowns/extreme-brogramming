FactoryGirl.define do
  factory :exercise do |e|
    e.sequence(:name) { |n| "exercise_#{n}" }
  end
end
