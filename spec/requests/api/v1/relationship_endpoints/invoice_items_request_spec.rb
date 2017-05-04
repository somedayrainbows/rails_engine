require 'rails_helper'

describe "invoice items api" do
  it "returns the associated invoice" do
    invoice = create(:invoice)
    invoice_item = create(:invoice_item, invoice_id: invoice.id)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    expect(response).to be_success
    invoice = JSON.parse(response.body)

    expect(invoice_item['invoice_id']).to eq(invoice['id'])
  end

  it "returns the associated item" do
    item = create(:item)
    invoice_item = create(:invoice_item, item_id: item.id)

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    expect(response).to be_success
    invoice = JSON.parse(response.body)

    expect(invoice_item['item_id']).to eq(item['id'])
  end
end
