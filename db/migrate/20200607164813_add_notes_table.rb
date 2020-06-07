class AddNotesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :player_id, null: false
      t.string :user_id, null: false
      t.text :note

      t.timestamps
    end
  end
end
