class AddIndexToTargetGamesTable < ActiveRecord::Migration[6.0]
  def change
    add_index :targetgames, :user_id
    add_index :targetgames, :contest_id
  end
end
