FactoryGirl.define do
  factory :workout do |w|
    w.sequence(:name) { |n| "workout_#{n}" }
    user

    factory :workout_with_workout_exercise do
      after(:create) do |workout|
        create(:workout_exercise, workout: workout)
      end
    end
  end
end
