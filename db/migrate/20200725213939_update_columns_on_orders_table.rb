class UpdateColumnsOnOrdersTable < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :price, :integer
    change_column :orders, :paid, :boolean, default: false
  end
end
