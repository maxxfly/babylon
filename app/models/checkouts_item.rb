# == Schema Information
#
# Table name: checkouts_items
#
#  id          :integer          not null, primary key
#  checkout_id :integer
#  item_id     :integer
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CheckoutsItem < ActiveRecord::Base

end
