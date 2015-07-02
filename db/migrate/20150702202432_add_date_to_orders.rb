class AddDateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :date, :date
  end
end
