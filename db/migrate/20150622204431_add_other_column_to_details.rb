class AddOtherColumnToDetails < ActiveRecord::Migration
  def change
    add_column :details, :plus, :decimal
    add_column :orders, :other, :string
  end
end
