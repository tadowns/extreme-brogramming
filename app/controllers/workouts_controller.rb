class WorkoutsController < ApplicationController
  expose(:workout) { current_user.workouts.find(params[:id]) }
  expose(:workout_exercises) { workout.workout_type.workout_exercises }
end
