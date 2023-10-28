class CreateHomeBlocks < ActiveRecord::Migration[7.0]
  def change
    create_table :homeblocks do |t|
      t.string :box_type
      t.string :title
      t.text :lower_text
      t.string :redirect_url
      t.string :role

      t.timestamps
    end
  end
end
