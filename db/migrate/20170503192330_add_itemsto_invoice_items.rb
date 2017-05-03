class AddItemstoInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :invoice_items, :items, foreign_key: true
  end
end
