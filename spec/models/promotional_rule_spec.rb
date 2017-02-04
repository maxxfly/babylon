# == Schema Information
#
# Table name: promotional_rules
#
#  id                   :integer          not null, primary key
#  item_id              :integer
#  trigger_count        :integer
#  trigger_sum          :integer
#  reduction_percentage :integer
#  reduction_fixed      :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'rails_helper'

RSpec.describe PromotionalRule, type: :model do
  context "reduction_percentage is already defined" do
    before { allow(subject).to receive(:reduction_percentage).and_return(10) }
    it { is_expected.not_to validate_presence_of(:reduction_fixed) }
  end

  context "reduction_percentage is empty" do
    before { allow(subject).to receive(:reduction_percentage).and_return(nil) }
    it { is_expected.to validate_presence_of(:reduction_fixed) }
  end

  context "item_id is already defined" do
    before { allow(subject).to receive(:item_id).and_return(1) }
    it { is_expected.to validate_presence_of(:trigger_count) }
  end

  context "item_id is empty" do
    before { allow(subject).to receive(:item_id).and_return(nil) }
    it { is_expected.not_to validate_presence_of(:trigger_count) }
  end

  context "empty item_id and trigger_count are incompatible" do
    let(:promotional_rule) { create(:promotional_rule, trigger_count: 10) }
    it { expect(promotional_rule).not_to be_valid }
    it { expect(promotional_rule.errors[:trigger_count]).to be }
  end

  context "trigger_sum and trigger_count are incompatible" do
    let(:promotional_rule) { create(:promotional_rule, trigger_count: 10, trigger_sum: 10) }
    it { expect(promotional_rule).not_to be_valid }
    it { expect(promotional_rule.errors[:trigger_count]).to be }
  end

  context "reduction_percentage and reduction_fixed are incompatible" do
    let(:promotional_rule) { create(:promotional_rule, reduction_fixed: 10, reduction_percentage: 10) }
    it { expect(promotional_rule).not_to be_valid }
    it { expect(promotional_rule.errors[:reduction_fixed]).to be }
  end

end
