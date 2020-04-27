class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :mascot
      t.integer :conference_id
      t.string :color_1
      t.string :color_2
      t.string :color_3
      t.integer :year
      t.string :record

      t.timestamps
    end
  end
end
