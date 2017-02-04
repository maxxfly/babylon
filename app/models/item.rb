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

class Item < ActiveRecord::Base

end
