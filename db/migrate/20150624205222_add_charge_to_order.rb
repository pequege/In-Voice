class AddChargeToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :charge, :decimal, :precision => 8, :scale => 2
  end
end
