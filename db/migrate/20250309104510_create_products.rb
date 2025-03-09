class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quanlity, null: false
      t.float :price, null: false
      t.text :description

      t.timestamps
    end
  end
end
