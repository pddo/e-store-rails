class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.text :short_desc
      t.string :full_desc
      t.float :price
      t.boolean :stocked

      t.timestamps
    end
  end
end
