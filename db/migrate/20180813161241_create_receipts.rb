class CreateReceipts < ActiveRecord::Migration[5.1]
  def change
    create_table :receipts do |t|
      t.references :vendors
      t.string :transaction_id
      t.timestamps
    end
  end
end
