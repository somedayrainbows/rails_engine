require "rails_helper"

describe "Invoice api" do
  it "returns a list of invoice items for a single invoice" do
    merchant1 = create(:merchant)
    customer1 = create(:customer)
    invoice1 = create(:invoice, merchant_id: merchant1.id, customer_id: customer1.id)
    item1 = create(:item, merchant_id: merchant1.id)
    item2 = create(:item, merchant_id: merchant1.id)
    invoice_item1 = create(:invoice_item, invoice_id: invoice1.id, item_id: item1.id)
    invoice_item2 = create(:invoice_item, invoice_id: invoice1.id, item_id: item1.id)

    get "/api/v1/invoices/#{invoice1.id}/invoice_items"

    expect(response).to be_success
    
    invoice_items = JSON.parse(response.body)

    expect(invoice_items.count).to eq(2)

  end
end
