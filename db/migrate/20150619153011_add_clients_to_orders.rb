class AddClientsToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :client, index: true
  end
end
