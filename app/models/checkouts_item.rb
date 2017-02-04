# == Schema Information
#
# Table name: checkouts_items
#
#  id          :integer          not null, primary key
#  checkout_id :integer
#  item_id     :integer
#  quantity    :integer
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CheckoutsItem < ActiveRecord::Base
  validates_presence_of :price
  validates_presence_of :item_id
  validates_presence_of :checkout_id
  validates_presence_of :quantity

  belongs_to :item
  belongs_to :checkout

end
