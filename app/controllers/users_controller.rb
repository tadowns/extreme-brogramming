class UsersController < ApplicationController
  expose(:workouts) { current_user.workouts }
  expose(:seshions) { current_user.seshions.limit(10) }
end
