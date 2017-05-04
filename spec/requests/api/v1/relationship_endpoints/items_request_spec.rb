require 'rails_helper'

describe "items api" do
  it "returns a collection of associated invoice items" do
    item = create(:item)
    create_list(:invoice_item, 4, item_id: item.id)

    get "/api/v1/items/#{item.id}/invoice_items"

    expect(response).to be_success
    invoice_items = JSON.parse(response.body)

    expect(invoice_items.count).to eq(4)

    expect(item.id).to eq(invoice_items.first["item_id"])
    expect(item.id).to eq(invoice_items.last["item_id"])
  end
end
