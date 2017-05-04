class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :unit_price, :merchant_id

  attribute :unit_price do
    (object["unit_price"].to_f / 100).to_s
  end

end
