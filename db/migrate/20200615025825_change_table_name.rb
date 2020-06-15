class ChangeTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :contests_tables, :contests
  end
end
