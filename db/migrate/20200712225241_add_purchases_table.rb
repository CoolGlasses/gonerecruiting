class AddPurchasesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.string :product_code
      t.numeric :price
      t.string :start_date
      t.string :end_date
      t.integer :organization_id

      t.timestamps
    end
  end
end
