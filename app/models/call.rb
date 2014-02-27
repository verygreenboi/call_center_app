# == Schema Information
#
# Table name: calls
#
#  id         :integer          not null, primary key
#  from       :string(255)
#  to         :string(255)
#  type       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  bank_id    :integer
#  account_id :integer
#

class Call < ActiveRecord::Base
	resourcify
end
