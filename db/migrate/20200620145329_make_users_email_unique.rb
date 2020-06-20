class MakeUsersEmailUnique < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :email, :citext, unique: true
  end
end
