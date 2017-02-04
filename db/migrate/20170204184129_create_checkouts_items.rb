class CreateCheckoutsItems < ActiveRecord::Migration[5.0]
  def change
    create_table :checkouts_items do |t|
      t.integer :checkout_id, null: :false
      t.integer :item_id, null: :false
      t.integer :quantity, null: :false
      t.integer :price, null: :false
      t.timestamps
    end
  end
end
