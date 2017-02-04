class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :product_code, null: :false
      t.integer :name, null: :false
      t.integer :price, null: :false
      t.timestamps
    end
  end
end
