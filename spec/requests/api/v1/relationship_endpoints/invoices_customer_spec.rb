require 'rails_helper'

describe "Invoice API" do
  it "sends the customer associated with a given invoice" do
    merchant1 = create(:merchant)
    customer1 = create(:customer)
    invoice1 = create(:invoice, customer_id: customer1.id, merchant_id: merchant1.id)

    get "/api/v1/invoices/#{invoice1.id}/customer"

    expect(response).to be_success
    customer = JSON.parse(response.body)
    expect(customer["first_name"]).to eq(customer1.first_name)
  end
end
