class ModifyColumnsInDetails < ActiveRecord::Migration
  def change
    remove_column :details, :rate, :string
    remove_column :details, :hour, :string
    add_column :details, :rate, :decimal
    add_column :details, :hour, :decimal
  end
end
