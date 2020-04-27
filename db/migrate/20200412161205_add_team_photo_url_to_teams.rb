class AddTeamPhotoUrlToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :team_photo_url, :string
  end
end
