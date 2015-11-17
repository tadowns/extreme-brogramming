FactoryGirl.define do
  factory :workout_type do |w|
    w.sequence(:name) { |n| "workout_type_#{n}" }
    user

    factory :workout_type_with_workout_exercise do
      after(:create) do |workout_type|
        create(:workout_exercise, workout_type: workout_type)
      end
    end
  end
end
