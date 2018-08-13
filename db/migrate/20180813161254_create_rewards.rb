class CreateRewards < ActiveRecord::Migration[5.1]
  def change
    create_table :rewards do |t|
      t.boolean :claimed
      t.string :description
      t.references :users
      t.timestamps
    end
  end
end
