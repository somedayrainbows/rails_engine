class AddQuantityToInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    add_column :invoice_items, :quantity, :integer
  end
end
