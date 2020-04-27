class AddSocialMediaToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :social_media, :string
  end
end
