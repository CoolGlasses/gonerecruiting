class AddIndexToProducts < ActiveRecord::Migration[6.0]
  def change
    add_index :products, :start_date
    add_index :products, :user_id
    add_index :products, :product_code
  end
end
