# == Schema Information
#
# Table name: checkouts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Checkout < ActiveRecord::Base

  has_many :checkouts_items
  has_many :items, through: :checkouts_items
  has_and_belongs_to_many :promotional_rules

  def initialize(*args)
    super(nil)

    # we attach the promotional_rules
    if args
      self.promotional_rules = args.flatten
    end

    self.save
  end


  def scan(product_code)
    item = Item.find_by_product_code(product_code)

    # if the item is already present is the checkout, we increment the quantity
    if ci = self.checkouts_items.find_by_item_id(item.id)
      ci.update_column(:quantity, ci.quantity + 1)
    else
      ci = self.checkouts_items.create(item_id: item.id,
                                       quantity: 1,
                                       price: item.price)
    end
  end

  def total
    tmp_total = 0
    self.checkouts_items.each do |ci|
      reduction_on_item = self.promotional_rules.find_by_item_id(ci.id)

      if reduction_on_item &&
        ci.quantity >= reduction_on_item.trigger_count
        # we find a reduction for this quantity
        unit_price = ci.price - reduction_on_item.compute_promotion(ci.price)
      else
        # normal case
        unit_price = ci.price
      end

      tmp_total = tmp_total + (unit_price * ci.quantity)
    end

    reduction_on_total = self.promotional_rules.find_by_item_id(nil)

    # we search if a reduction for the sum exists
    if reduction_on_total &&
      tmp_total >= reduction_on_total.trigger_sum
      tmp_total = tmp_total - reduction_on_total.compute_promotion(tmp_total)
    end

    tmp_total
  end

end
