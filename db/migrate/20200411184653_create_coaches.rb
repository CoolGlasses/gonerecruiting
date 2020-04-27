class CreateCoaches < ActiveRecord::Migration[5.2]
  def change
    create_table :coaches do |t|
      t.string :name, null: false
      t.string :cell
      t.string :phone
      t.string :email
      t.integer :team_id
      t.integer :school_d

      t.timestamps
    end
  end
end
