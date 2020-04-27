class ChangeColumnNameGradYr < ActiveRecord::Migration[5.2]
  def change
    rename_column :players, :grad_yr, :grade
  end
end
