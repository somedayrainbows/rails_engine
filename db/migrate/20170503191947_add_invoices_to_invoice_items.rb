class AddInvoicesToInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :invoice_items, :invoices, foreign_key: true
  end
end
