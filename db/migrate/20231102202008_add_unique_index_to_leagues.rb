class AddUniqueIndexToLeagues < ActiveRecord::Migration[7.0]
  def change
    add_index :leagues, :name, unique: true
  end
end
