class AddRedirectNumberToBanks < ActiveRecord::Migration
  def change
    add_column :banks, :redirect_number, :string
  end
end
