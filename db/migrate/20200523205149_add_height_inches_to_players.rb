class AddHeightInchesToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :height_inches, :integer
  end
end
