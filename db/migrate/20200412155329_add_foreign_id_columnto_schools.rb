class AddForeignIdColumntoSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :osaa_school_id, :integer
  end
end
