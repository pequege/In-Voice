class AddColumsToDetails < ActiveRecord::Migration
  def change
    add_column :details, :task, :string
    add_column :details, :description, :string
    add_column :details, :hour, :string
    add_column :details, :rate, :string
    add_column :details, :amount, :string
  end
end
