class CreateToDoTable < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.integer :user_id
      t.integer :player_id
      t.integer :contest_id
      t.datetime :due_by
      t.integer :duration
      t.string :description
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
