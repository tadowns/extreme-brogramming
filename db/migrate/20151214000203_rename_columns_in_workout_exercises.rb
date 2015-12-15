class RenameColumnsInWorkoutExercises < ActiveRecord::Migration
  def change
    rename_column :workout_exercises, :reps, :target_reps
    rename_column :workout_exercises, :sets, :target_sets
  end
end
