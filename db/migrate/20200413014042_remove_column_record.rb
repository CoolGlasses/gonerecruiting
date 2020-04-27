class RemoveColumnRecord < ActiveRecord::Migration[5.2]
  def change
    remove_column :schools, :record
  end
end
