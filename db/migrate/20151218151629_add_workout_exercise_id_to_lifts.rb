class AddWorkoutExerciseIdToLifts < ActiveRecord::Migration
  def change
    add_column :lifts, :workout_exercise_id, :integer
    add_index :lifts, :workout_exercise_id
  end
end
