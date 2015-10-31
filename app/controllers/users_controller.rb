class UsersController < ApplicationController
  expose(:workout_types) { current_user.workout_types }
  expose(:workouts) { current_user.workouts.limit(10) }
end
