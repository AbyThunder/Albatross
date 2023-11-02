class AddStatusToTables < ActiveRecord::Migration[7.0]
  def change
    add_column :tournaments, :status, :string, default: 'upcoming', null: false
    add_column :academies, :status, :string, default: 'upcoming', null: false
    add_column :leagues, :status, :string, default: 'upcoming', null: false
  end
end
