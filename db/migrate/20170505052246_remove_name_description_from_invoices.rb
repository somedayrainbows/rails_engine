class RemoveNameDescriptionFromInvoices < ActiveRecord::Migration[5.0]
  def change
    remove_column :invoices, :name, :string
    remove_column :invoices, :description, :string
  end
end
