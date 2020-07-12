class RemoveBadColumnsFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :user_id
    remove_column :products, :start_date
    remove_column :products, :end_date
    remove_column :products, :organization_id
  end
end
