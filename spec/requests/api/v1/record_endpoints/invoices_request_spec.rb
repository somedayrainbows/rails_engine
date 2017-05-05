require 'rails_helper'

describe "Invoices API" do
  it "sends a list of invoices" do

    create_list(:invoice, 3)

    get '/api/v1/invoices'

    expect(response).to be_success

    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(3)
  end

  it "can get one invoice by its id" do
    id = create(:invoice).id

    get "/api/v1/invoices/#{id}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["id"]).to eq(id)
  end

  it "can find a invoice by id" do
    invoice_id = create(:invoice)

    get "/api/v1/invoices/find?id=#{invoice_id.id}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["id"]).to eq(invoice_id.id)
  end

  it "can find an invoice by creation date" do
    created_invoice = create(:invoice, created_at: "2017-05-04 23:05:01")

    get "/api/v1/invoices/find?created_at=#{created_invoice.created_at}"

    invoice = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoice["id"]).to eq(created_invoice.id)
  end

  it "can find an invoice by updated date" do
    updated_invoice = create(:invoice, updated_at: "2017-05-02T03:04:05.000Z")

    get "/api/v1/invoices/find?updated_at=#{updated_invoice.updated_at}"

    invoice = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoice["id"]).to eq(updated_invoice.id)
  end

  it "can find all invoices by id" do
    invoice1 = create(:invoice)

    get "/api/v1/invoices/find_all?id=#{invoice1.id}"

    invoice = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoice[0]["id"]).to eq(invoice1.id)
  end

  it 'returns a random invoice' do
    create_list(:invoice, 100)

    get '/api/v1/invoices/random'

    invoice_1 = JSON.parse(response.body)

    random_invoice = Invoice.find(invoice_1["id"])

    get '/api/v1/invoices/random'

    invoice_2 = JSON.parse(response.body)
    random_invoice2 = Invoice.find(invoice_2["id"])

    expect(invoice_1).to_not eq(invoice_2)
  end
end
