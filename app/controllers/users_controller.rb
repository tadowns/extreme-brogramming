class UsersController < ApplicationController
  def dashboard
    @workouts = current_user.workouts
  end
end
