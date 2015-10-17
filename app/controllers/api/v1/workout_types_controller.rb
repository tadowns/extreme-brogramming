class Api::V1::WorkoutTypesController < Api::V1::ApiController
  def index
    render json: WorkoutType.limit(25)
  end

  def create
    workout_type = current_user
      .workout_types
      .create(workout_type_params)

    render json: workout_type.to_builder.target!
  end

  private

    def workout_type_params
      params.require(:workout_type).permit(WorkoutType.allowed_params)
    end
end
