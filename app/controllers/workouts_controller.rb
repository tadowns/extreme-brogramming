class WorkoutsController < ApplicationController
  expose(:workout)

  def create
    workout.attributes(workout_params)

    if workout.save
      redirect_to start_path, success: 'Workout added'
    else
      render 'new'
    end
  end

  def destroy
    if workout.present? && workout.persisted?
      workout.destroy
      redirect_to :back, success: 'Workout deleted'
    else
      redirect_to :back, alert: 'An error occurred when trying to delete the workout'
    end
  end

  def start_seshion
    seshion = current_user.seshions.create(
      workout: workout,
      date: DateTime.now
    )

    redirect_to seshion
  end

  private

    def workout_params
      params
        .require(:workout)
        .permit([
          :name,
          workout_exercises_attributes: [
            :exercise_type,
            :sets,
            :reps
          ]
        ])
    end

    def workout
      current_user.workouts.find_by(id: params[:id]) || current_user.workouts.build
    end
end
