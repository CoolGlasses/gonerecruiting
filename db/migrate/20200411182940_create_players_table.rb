class CreatePlayersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.string :position
      t.string :height
      t.string :grad_yr
      t.string :home_number
      t.string :away_number
      t.integer :team_id, null: false
      t.integer :club_id


      t.timestamps
    end
  end
end
