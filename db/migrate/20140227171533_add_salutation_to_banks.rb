class AddSalutationToBanks < ActiveRecord::Migration
  def change
    add_column :banks, :greeting, :text
  end
end
