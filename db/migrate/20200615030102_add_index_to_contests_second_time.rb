class AddIndexToContestsSecondTime < ActiveRecord::Migration[5.2]
  def change
    add_index :contests, :home_id
    add_index :contests, :away_id
  end
end
