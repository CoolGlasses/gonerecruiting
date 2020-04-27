class AddColumnClassification < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :classification, :integer
  end
end
