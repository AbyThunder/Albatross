class AddSponsorsToAcademies < ActiveRecord::Migration[7.0]
  def change
    add_column :academies, :sponsor, :string
  end
end
