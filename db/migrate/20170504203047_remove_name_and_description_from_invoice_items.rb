class RemoveNameAndDescriptionFromInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :invoice_items, :name, :string
    remove_column :invoice_items, :description, :string
  end
end
