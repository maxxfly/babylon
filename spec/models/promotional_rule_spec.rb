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
    before { allow(subject).to receive(:reduction_percentage?).and_return(true) }
    it { is_expected.not_to validate_presence_of(:reduction_fixed) }
  end

  context "reduction_percentage is empty" do
    before { allow(subject).to receive(:reduction_percentage?).and_return(false) }
    it { is_expected.to validate_presence_of(:reduction_fixed) }
  end

  context "item_id is already defined" do
    before { allow(subject).to receive(:item_id?).and_return(true) }
    it { is_expected.to validate_presence_of(:trigger_count) }
  end

  context "item_id is empty" do
    before { allow(subject).to receive(:item_id?).and_return(false) }
    it { is_expected.not_to validate_presence_of(:trigger_count) }
  end

  context "trigger_sum and trigger_count are incompatible" do
    before { allow(subject).to receive(:trigger_count?).and_return(true) }
    it { is_expected.to validate_absence_of(:trigger_sum) }
  end

  context "reduction_percentage and reduction_fixed are incompatible" do
    before { allow(subject).to receive(:reduction_percentage?).and_return(true) }
    it { is_expected.to validate_absence_of(:reduction_fixed) }
  end

end
