class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.integer :workout_id
      t.integer :workout_exercise_id
    end
    add_index :exercises, :workout_id
    add_index :exercises, :workout_exercise_id
  end
end
