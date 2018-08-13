class CreateLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items do |t|
      t.string :description
      t.string :sku
      t.decimal :price
      t.integer :quantity
      t.timestamps
    end
  end
end
