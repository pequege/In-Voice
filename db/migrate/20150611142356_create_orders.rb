class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :date
      t.string :bill_to_name
      t.string :bill_to_org
      t.string :bill_to_address
      t.string :bill_to_email
      t.string :extra_notes
      t.string :extra_others

      t.timestamps null: false
    end
  end
end
