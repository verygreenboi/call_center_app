class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
    	t.string :name
    	t.string :phone_number
    	t.reference :user
      t.timestamps
    end
  end
end
