class AddIndexToRecruits < ActiveRecord::Migration[5.2]
  def change
    add_index :recruits, :user_id
    add_index :recruits, :player_id
  end
end
