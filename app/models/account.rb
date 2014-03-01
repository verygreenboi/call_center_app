# == Schema Information
#
# Table name: accounts
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  account_number :string(255)
#  pin            :string(255)
#  verify         :string(255)
#  balance        :integer
#  currency       :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  bank_id        :integer
#

class Account < ActiveRecord::Base
	resourcify
	belongs_to :bank
end
