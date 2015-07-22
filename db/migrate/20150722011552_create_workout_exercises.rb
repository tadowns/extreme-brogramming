class CreateWorkoutExercises < ActiveRecord::Migration
  def change
    create_table :workout_exercises do |t|
      t.integer :workout_type_id
      t.integer :exercise_type_id
      t.integer :sets
      t.integer :reps
    end
    add_index :workout_exercises, :workout_type_id
    add_index :workout_exercises, :exercise_type_id
  end
end
