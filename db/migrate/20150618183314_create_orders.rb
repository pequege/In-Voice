class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :extra

      t.timestamps null: false
    end
  end
end
