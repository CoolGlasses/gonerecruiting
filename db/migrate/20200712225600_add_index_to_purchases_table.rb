class AddIndexToPurchasesTable < ActiveRecord::Migration[6.0]
  def change
    add_index :purchases, :user_id
    add_index :purchases, :start_date
    add_index :purchases, :end_date
    add_index :purchases, :organization_id
  end
end
