class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :order, index: true, foreign_key: true
      t.string :project
      t.string :task
      t.string :description
      t.integer :hours
      t.decimal :rate
      t.integer :amount

      t.timestamps null: false
    end
  end
end
