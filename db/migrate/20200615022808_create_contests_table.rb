class CreateContestsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :contests_tables do |t|
      t.string :status
      t.string :start_at
      t.integer :home_id
      t.boolean :home_win
      t.boolean :home_tie
      t.boolean :home_forfeit
      t.integer :home_score
      t.string :home_name
      t.integer :away_id
      t.boolean :away_win
      t.boolean :away_tie
      t.boolean :away_forfeit
      t.integer :away_score
      t.string :away_name

      t.timestamps
    end
  end
end
