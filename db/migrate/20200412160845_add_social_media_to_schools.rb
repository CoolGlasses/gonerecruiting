class AddSocialMediaToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :social_media, :string
  end
end
