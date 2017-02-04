# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  code       :integer
#  name       :integer
#  prices     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Item, type: :model do
  it { is_expected.to validate_presence_of :code }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :price }
  it { is_expected.to validate_uniqueness_of :code }
end
