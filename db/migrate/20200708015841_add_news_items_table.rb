class AddNewsItemsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :news_items do |t|
      t.string :title, null: false
      t.string :textarea
      t.string :author, null: false

      t.timestamps
    end
  end
end
