class ChangeContactInfoTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :contact_info, :contact_cards
  end
end
