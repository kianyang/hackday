class FixReferencesMigration < ActiveRecord::Migration[5.1]
  def change
    rename_column(:receipts, :vendors_id, :vendor_id)
    rename_column(:rewards, :users_id, :user_id)
    rename_column(:products, :categories_id, :category_id)
    remove_column(:products, :quantity)
  end
end
