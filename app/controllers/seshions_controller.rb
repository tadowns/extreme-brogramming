class SeshionsController < ApplicationController
  expose(:seshion) { current_user.seshions.find(params[:id]) }
  expose(:lifts) { seshion.lifts }
  expose(:workout) do
    if params[:workout_id].present?
      current_user.workouts.find_by(id: params[:workout_id])
    else
      seshion.workout
    end
  end

  def create
    redirect_to seshions_path(Seshion.build_from_workout(workout, current_user).tap { |s| s.save })
  end
end
