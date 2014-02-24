class AddReferenceToAccounts < ActiveRecord::Migration
  def change
  	add_reference :accounts, :bank, index: true
  end
end
