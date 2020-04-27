class AddForeignIdColumntoTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :osaa_school_id, :integer
  end
end
