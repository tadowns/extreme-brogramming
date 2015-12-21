class WorkoutsController < ApplicationController
  def destroy
    if workout.present? && workout.persisted?
      workout.destroy
      redirect_to :back, success: 'Workout deleted'
    else
      redirect_to :back, alert: 'An error occurred when trying to delete the workout'
    end
  end

  private

    def workout
      current_user.workouts.find_by(id: params[:id]) || current_user.workouts.build
    end
end
