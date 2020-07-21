class AddColumnsToOrdersTable < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :product_id, :integer
    add_column :orders, :status, :integer, default: 0
    add_column :orders, :token, :string
    add_column :orders, :charge_id, :string
    add_column :orders, :error_message, :string
    add_column :orders, :customer_id, :string
    add_column :orders, :payment_gateway, :integer
    add_monetize :orders, :price, currency: { present: false }
  end
end
