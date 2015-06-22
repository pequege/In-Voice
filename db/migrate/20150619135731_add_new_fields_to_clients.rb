class AddNewFieldsToClients < ActiveRecord::Migration
  def change
    add_column :clients, :organization, :string
    add_column :clients, :address, :string
    add_column :clients, :email, :string
    add_column :clients, :url, :string
    add_column :clients, :language, :string
  end
end
