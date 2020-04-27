class AddIndexesPlayers < ActiveRecord::Migration[5.2]
  def change
    add_index :players, :team_id
  end
end
