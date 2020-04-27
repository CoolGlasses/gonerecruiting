class ChangeColumnNameConferenceId < ActiveRecord::Migration[5.2]
  def change
    rename_column :schools, :conference_id, :league
  end
end
