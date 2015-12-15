class RefactorTableNames < ActiveRecord::Migration
  def change
    rename_table :workouts, :sessions
    rename_column :sessions, :workout_type_id, :workout_id

    rename_table :exercises, :lifts
    rename_column :lifts, :workout_id, :session_id

    rename_table :workout_sets, :sets
    rename_column :sets, :exercise_id, :lift_id

    rename_table :workout_types, :workouts
    rename_table :exercise_types, :exercises

    rename_column :workout_exercises, :workout_type_id, :workout_id
    rename_column :workout_exercises, :exercise_type_id, :exercise_id
  end
end
