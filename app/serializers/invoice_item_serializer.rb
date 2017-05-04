class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :invoice_id, :item_id, :quantity, :unit_price

  attribute :unit_price do
  
    (object["unit_price"].to_f / 100).to_s
  end
end
