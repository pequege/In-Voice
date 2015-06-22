class DropClientsOrderTables < ActiveRecord::Migration
  def change
    drop_table :order_items
    drop_table :clients
    drop_table :orders
  end
end
