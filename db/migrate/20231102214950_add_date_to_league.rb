class AddDateToLeague < ActiveRecord::Migration[7.0]
  def change
    add_column :leagues, :date, :string
  end
end
