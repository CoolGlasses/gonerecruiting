class AddIndexToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_index :players, :height_inches
  end
end
