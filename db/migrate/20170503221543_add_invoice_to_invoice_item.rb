class AddInvoiceToInvoiceItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :invoices, :invoice_items, foreign_key: true
  end
end
