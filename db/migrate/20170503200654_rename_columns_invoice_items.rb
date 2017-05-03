class RenameColumnsInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :invoice_items, :invoices_id, :invoice_id
    rename_column :invoice_items, :items_id, :item_id
  end
end
