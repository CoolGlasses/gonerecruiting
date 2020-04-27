class CreateConferences < ActiveRecord::Migration[5.2]
  def change
    create_table :conferences do |t|
      t.string :name, null: false
      t.integer :classification_id

      t.timestamps
    end
  end
end
