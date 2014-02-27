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
#

class Bank < ActiveRecord::Base
	resourcify
end
