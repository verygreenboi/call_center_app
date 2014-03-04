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
	validates :account_number, presence: true,
                    uniqueness: true, length: { maximum: 50, minimum: 8 }, numericality: { only_integer: true }
  validates :pin, presence: true, length: { maximum: 5, minimum: 4 }, numericality: { only_integer: true }
  validates :verify, presence: true, length: { maximum: 5, minimum: 4 }, numericality: { only_integer: true }
  validates :currency, presence: true
  validates :name, presence: true
  validates :balance, numericality: true
	belongs_to :bank
end