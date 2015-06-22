class ChangeColumnRateInDetails < ActiveRecord::Migration
  def change
    remove_column :details, :amount, :string
    add_column :details, :amount, :decimal
  end
end
