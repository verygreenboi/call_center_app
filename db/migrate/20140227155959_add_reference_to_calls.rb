class AddReferenceToCalls < ActiveRecord::Migration
  def change
  	add_reference :calls, :bank, index: true
  	add_reference :calls, :account, index: true
  end
end
