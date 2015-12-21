class ChangeWorkoutExercises < ActiveRecord::Migration
  def change
    add_column :workout_exercises, :name, :string
    remove_column :lifts, :exercise_id
    remove_column :workout_exercises, :exercise_id
  end
end
