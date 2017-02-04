class CreatePromotionalRules < ActiveRecord::Migration[5.0]
  def change
    create_table :promotional_rules do |t|
      t.integer :item_id
      t.integer :trigger_count
      t.integer :trigger_sum
      t.integer :reduction_percentage
      t.integer :reduction_fixed
      t.timestamps
    end
  end
end
