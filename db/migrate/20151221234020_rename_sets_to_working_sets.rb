class RenameSetsToWorkingSets < ActiveRecord::Migration
  def change
    rename_table :sets, :working_sets
  end
end
