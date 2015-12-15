class RenameTableSessionsToSeshions < ActiveRecord::Migration
  def change
    rename_table :sessions, :seshions
  end
end
