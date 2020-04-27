class CreateTeamsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.integer :school_id
      t.integer :coach_id
      t.integer :club_id
      t.string :updated_at

      t.timestamps
    end
  end
end
