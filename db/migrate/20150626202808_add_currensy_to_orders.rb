class AddCurrensyToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :currensy_type, :string
  end
end
