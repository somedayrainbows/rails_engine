require 'rails_helper'

describe "Transaction API" do
  it "returns the associated invoice" do
    invoice = create(:invoice)
    transaction = create(:transaction, invoice: invoice)

    get "/api/v1/transactions/#{transaction.id}/invoice"

    expect(response).to be_success
    invoice1 = JSON.parse(response.body)
    expect(invoice1["id"]).to eq(transaction.invoice_id)
  end
end
