class CreateWorkoutType < ActiveRecord::Migration
  def change
    create_table :workout_types do |t|
      t.string :name
    end
  end
end
