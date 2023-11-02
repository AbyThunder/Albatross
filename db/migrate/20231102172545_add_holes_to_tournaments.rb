class AddHolesToTournaments < ActiveRecord::Migration[7.0]
  def change
    add_column :tournaments, :holes, :integer
    remove_column :tournaments, :sponser
  end
end
