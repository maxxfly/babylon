class CreateJoinTableCheckoutPromotionalRule < ActiveRecord::Migration[5.0]
  def change
    create_table :checkouts_promotional_rules do |t|
      t.references :checkout, null: false
      t.references :promotional_rule, null: false
    end
  end
end
