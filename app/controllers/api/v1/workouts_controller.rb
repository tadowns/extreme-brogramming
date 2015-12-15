class Api::V1::WorkoutsController < Api::V1::ApiController
  def index
    render json: Workout.limit(25)
  end

  def create
    workout = current_user
      .workouts
      .create(workout_params)

    render json: workout.to_builder.target!
  end

  private

    def workout_params
      params.require(:workout).permit(Workout.allowed_params)
    end
end
