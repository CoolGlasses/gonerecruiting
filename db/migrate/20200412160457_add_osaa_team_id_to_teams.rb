class AddOsaaTeamIdToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :osaa_team_id, :integer
  end
end
