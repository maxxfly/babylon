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

require 'rails_helper'

RSpec.describe CheckoutsItem do
  it { is_expected.to validate_presence_of :price }
  it { is_expected.to validate_presence_of :checkout_id }
  it { is_expected.to validate_presence_of :item_id }
  it { is_expected.to validate_presence_of :quantity }
end
