class AddImageToTournaments < ActiveRecord::Migration[7.0]
  def change
    add_column :tournaments, :image_url, :string
    add_column :academies, :image_url, :string
    add_column :leagues, :image_url, :string
  end
end
