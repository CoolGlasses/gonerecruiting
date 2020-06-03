class AddEmailToUsers < ActiveRecord::Migration[5.2]
  def change
    enable_extension("citext")

    add_column :users, :email, :citext
  end
end
