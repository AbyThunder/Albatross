class RemoveImageUrl < ActiveRecord::Migration[7.0]
  def change
    remove_column :academies, :image_url, :string
  end
end
