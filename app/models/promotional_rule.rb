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

class PromotionalRule < ActiveRecord::Base
  belongs_to :item, optional: true
  has_and_belongs_to_many :checkouts

  validates_presence_of :reduction_fixed, unless: :reduction_percentage?
  validates_absence_of :reduction_fixed, if: :reduction_percentage?

  validates_presence_of :trigger_count, if: :item_id?
  validates_presence_of :trigger_sum, unless: :trigger_count?
  validates_absence_of :trigger_sum, if: :trigger_count?

  def compute_promotion(price)
    if self.reduction_fixed
      reduction_fixed
    else
      price * (reduction_percentage )/100
    end
  end

end
