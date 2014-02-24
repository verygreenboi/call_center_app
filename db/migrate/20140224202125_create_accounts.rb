class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
    	t.string :name
    	t.string :account_number
    	t.string :pin
    	t.string :verify
    	t.integer :balance
    	t.string :currency
      t.timestamps
    end
  end
end
