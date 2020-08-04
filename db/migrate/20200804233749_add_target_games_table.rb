class AddTargetGamesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :targetgames do |t|
      t.integer :user_id
      t.integer :contest_id

      t.timestamps
    end
  end
end
