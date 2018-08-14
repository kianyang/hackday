class AddReceiptIdToLineItems < ActiveRecord::Migration[5.1]
  def change
    add_column :line_items, :receipt_id, :integer
  end
end
