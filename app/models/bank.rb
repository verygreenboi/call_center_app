# == Schema Information
#
# Table name: banks
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  phone_number :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#  greeting     :text
#

class Bank < ActiveRecord::Base
	resourcify
	validates :phone_number, presence: true,
                    uniqueness: true
  validates :greeting, presence: true
  validates :name, presence: true
	belongs_to :user
	has_many :accounts, dependent: :destroy
end
