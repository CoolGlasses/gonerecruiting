class AddIndexToContactInfoTwo < ActiveRecord::Migration[5.2]
  def change
    add_index :contact_info, :player_id
    add_index :contact_info, :user_id
  end
end
