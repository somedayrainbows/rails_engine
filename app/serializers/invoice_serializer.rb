class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :customer_id, :merchant_id, :created_at, :updated_at
end
