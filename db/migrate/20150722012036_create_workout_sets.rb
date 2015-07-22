class CreateWorkoutSets < ActiveRecord::Migration
  def change
    create_table :workout_sets do |t|
      t.integer :exercise_id
      t.integer :reps
      t.float :weight
      t.datetime :start_time
      t.datetime :end_time
    end
    add_index :workout_sets, :exercise_id
  end
end
