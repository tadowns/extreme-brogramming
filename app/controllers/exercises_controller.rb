class ExercisesController < ActionController::Base
  expose(:exercises) { Exercise.all }
end
