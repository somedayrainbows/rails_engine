FactoryGirl.define do
  factory :invoice_item do
    name "batting glove"
    description "used for batting"
    invoice
    item
  end
end
