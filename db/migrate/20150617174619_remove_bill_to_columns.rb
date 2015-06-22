class RemoveBillToColumns < ActiveRecord::Migration
  def change
    remove_column :orders, :bill_to_name
    remove_column :orders, :bill_to_org
    remove_column :orders, :bill_to_address
    remove_column :orders, :bill_to_email
  end
end
