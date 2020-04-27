class AddIndexestoTables < ActiveRecord::Migration[5.2]
  def change
    add_index :schools, :osaa_school_id, unique: true
  end
end
