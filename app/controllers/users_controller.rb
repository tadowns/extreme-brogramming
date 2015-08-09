class UsersController < ApplicationController
  expose(:workout_types) { current_user.workout_types }
end
