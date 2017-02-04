# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  product_code :integer
#  name         :integer
#  price        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Item < ActiveRecord::Base
  has_many :checkouts_items

  validates_presence_of :name
  validates_presence_of :price
  validates_presence_of :product_code

  validates_uniqueness_of :product_code
end
