class AddNotesTableBack < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.integer :player_id, null: false
      t.integer :user_id, null: false
      t.text :note

      t.timestamps
    end
  end
end
