class CreateVendors < ActiveRecord::Migration[5.1]
  def change
    create_table :vendors do |t|
      t.string :name
      t.text :description
      t.text :address
      t.string :company_registration
      t.timestamps
    end
  end
end
