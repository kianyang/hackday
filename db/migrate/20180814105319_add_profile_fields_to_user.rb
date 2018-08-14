class AddProfileFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :postal_code, :string
  end
end
