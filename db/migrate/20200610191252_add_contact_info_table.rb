class AddContactInfoTable < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_info do |t|
      t.integer :player_id, null: false
      t.integer :user_id, null: false
      t.string :street
      t.string :email
      t.string :city
      t.string :state
      t.integer :zip
      t.string :cell
      t.string :phone


      t.timestamps
    end
  end
end
