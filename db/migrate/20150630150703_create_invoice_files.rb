class CreateInvoiceFiles < ActiveRecord::Migration
  def change
    add_attachment :orders, :invoice_file
  end
end
