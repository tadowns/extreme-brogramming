class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :workout_type_id
      t.integer :user_id
      t.datetime :date
    end
    add_index :workouts, :workout_type_id
    add_index :workouts, :date
    add_index :workouts, :user_id
  end
end
