	class AddReferenceToBank < ActiveRecord::Migration
  def change
  	add_reference :banks, :user, index: true
  end
end
