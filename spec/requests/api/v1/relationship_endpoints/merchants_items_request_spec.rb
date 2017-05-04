require 'rails_helper'

describe "merchant api" do
  it "returns a list of items for a given merchant" do
    merchant = create(:merchant)
    item1 = create(:item, merchant_id: merchant.id)
    item2 = create(:item, merchant_id: merchant.id)

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response).to be_success
    items = JSON.parse(response.body)

    expect(items.count).to eq(2)
    expect(items.first["name"]).to eq(item1.name)
    expect(items.last["name"]).to eq(item2.name)
  end
end
