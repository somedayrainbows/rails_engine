require 'rails_helper'

describe "Invoice API" do
  it "sends a list of items for a given invoice" do
    merchant_1 = create(:merchant)
    customer_1 = create(:customer)
		invoice_1 = create(:invoice)
		item_1 = create(:item)
		item_2 = create(:item)
		invoice_item_1 = create(:invoice_item, invoice_id: invoice_1.id, item_id: item_1.id)
		invoice_item_2 = create(:invoice_item, invoice_id: invoice_1.id, item_id: item_2.id)

    get "/api/v1/invoices/#{invoice_1.id}/items"

    expect(response).to be_success
    items = JSON.parse(response.body)
    expect(items.count).to eq(2)
  end
end
