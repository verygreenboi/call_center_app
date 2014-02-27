class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
    	t.string :from
    	t.string :to
    	t.string :type
      t.timestamps
    end
  end
end
