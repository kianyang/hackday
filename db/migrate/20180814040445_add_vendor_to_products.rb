class AddVendorToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :vendor_id, :integer
  end
end
