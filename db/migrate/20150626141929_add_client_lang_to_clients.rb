class AddClientLangToClients < ActiveRecord::Migration
  def change
    add_column :clients, :client_lang, :string
  end
end
