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

end
