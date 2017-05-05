require "rails_helper"

describe "Invoice API" do
  it "returns a list of transactions for a given invoice" do
    merchant1 = create(:merchant)
    customer1 = create(:customer)
    invoice1 = create(:invoice, customer_id: customer1.id, merchant_id: merchant1.id)
		transaction1 = create(:transaction, invoice_id: invoice1.id)
		transaction2 = create(:transaction, invoice_id: invoice1.id)


    get "/api/v1/invoices/#{invoice1.id}/transactions"

    expect(response).to be_success
    transactions = JSON.parse(response.body)
    expect(transactions.count).to eq(2)
  end
end
