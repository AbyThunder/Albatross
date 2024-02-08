class AddRelationsToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :academy
    add_reference :users, :league_registration 
  end
end
