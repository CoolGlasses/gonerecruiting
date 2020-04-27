class AddIndexesTeams < ActiveRecord::Migration[5.2]
  def change
    add_index :teams, :osaa_team_id, unique: true
    add_index :teams, :osaa_school_id, unique: true
  end
end
