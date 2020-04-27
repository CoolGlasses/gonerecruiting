class CreateAthleticDirectors < ActiveRecord::Migration[5.2]
  def change
    create_table :athletic_directors do |t|
      t.string :name, null: false
      t.integer :school_id
      t.string :phone
      t.string :email
      t.string :cell

      t.timestamps
    end
  end
end
