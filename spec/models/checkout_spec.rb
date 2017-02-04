# == Schema Information
#
# Table name: checkouts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Checkout do
  let!(:item_1) do
    create(:item, product_code: "001", price: 925, name: 'Lavender heart')
  end

  let!(:item_2) do
    create(:item, product_code: "002", price: 4500, name: 'Personalised cufflinks')
  end

  let!(:item_3) do
    create(:item, product_code: "003", price: 1995, name: 'Kids T-shirt')
  end

  let(:promotional_rule_1) do
    create(:promotional_rule,
           trigger_sum: 60,
           reduction_percentage: 10)
  end

  let(:promonation_rule_2) do
    create(:promotional_rule,
           item_id: item_2.id,
           trigger_count: 2,
           reduction_fixed: item_2.price - 850)
  end

  let(:promotional_rules) do
    [promotional_rule_1, promotional_rule_2]
  end

  let(:co) { Checkout.new(promotional_rules) }

  context "first basket" do
    before do
      co.scan('001')
      co.scan('002')
      co.scan('003')
    end

    it { expect(co.total).to eql 6678 }
  end

  context "second basket" do
    before do
      co.scan('001')
      co.scan('003')
      co.scan('001')
    end

    it { expect(co.total).to eql 3695 }
  end

  context "3th basket" do
    before do
      co.scan('001')
      co.scan('002')
      co.scan('001')
      co.scan('003')
    end

    it { expect(co.total).to eql 7376 }
  end
end
