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

  it "returns a list of invoices for a given merchant" do
    merchant = create(:merchant)
    invoice1 = create(:invoice, merchant_id: merchant.id)
    invoice2 = create(:invoice, merchant_id: merchant.id)

    get "/api/v1/merchants/#{merchant.id}/invoices"

    expect(response).to be_success
    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(2)
    expect(invoices.first["id"]).to eq(invoice1.id)
    expect(invoices.last["id"]).to eq(invoice2.id)
  end
end
