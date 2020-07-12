class AddProductsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :product_code
      t.string :description
      t.numeric :price
      t.string :start_date
      t.string :end_date
      t.integer :user_id
      t.integer :organization_id

      t.timestamps
    end
  end
end
