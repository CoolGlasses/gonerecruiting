class AddRecruitsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :recruits do |t|
      t.integer :user_id, null: false
      t.integer :player_id, null: false


      t.timestamps
    end
  end
end