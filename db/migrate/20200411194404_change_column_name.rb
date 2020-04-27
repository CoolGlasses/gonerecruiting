class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :coaches, :school_d, :school_id
  end
end
