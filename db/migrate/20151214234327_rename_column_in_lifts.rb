class RenameColumnInLifts < ActiveRecord::Migration
  def change
    rename_column :lifts, :session_id, :seshion_id
  end
end
