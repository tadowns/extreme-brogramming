class WorkoutTypesController < ApplicationController
  expose(:workout_type)

  def create
    workout_type.attributes(workout_type_params)

    if workout_type.save
      redirect_to start_path, success: 'Workout added'
    else
      render 'new'
    end
  end

  def destroy
    workout_type = current_user.workout_types.find_by(id: params[:id])

    if workout_type.present?
      workout_type.destroy
      redirect_to :back, success: 'Workout deleted'
    else
      redirect_to :back, alert: 'An error occurred when trying to delete the workout'
    end
  end

  def start_workout
    workout = current_user.workouts.create(
      workout_type: workout_type,
      date: DateTime.now
    )

    redirect_to workout
  end

  private

    def workout_type_params
      params
        .require(:workout_type)
        .permit([
          :name,
          workout_exercises_attributes: [
            :exercise_type,
            :sets,
            :reps
          ]
        ])
    end

    def workout_type
      current_user.workout_types.find_by(id: params[:id]) || current_user.workout_types.build
    end
end
