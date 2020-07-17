class AddStateToSchoolsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :schools, :state, :string
  end
end
