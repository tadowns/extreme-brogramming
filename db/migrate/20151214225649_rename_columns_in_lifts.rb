class RenameColumnsInLifts < ActiveRecord::Migration
  def change
    rename_column :lifts, :workout_exercise_id, :exercise_id
  end
end
