class AddColumnsToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :school_name, :string
    add_column :players, :classification, :string
    add_column :players, :mascot, :string
    add_column :players, :color_1, :string
    add_column :players, :color_2, :string
    add_column :players, :league, :string

    add_index :players, :school_name
  end
end
