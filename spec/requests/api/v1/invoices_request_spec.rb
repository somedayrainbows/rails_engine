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

  it "can find a invoice by name" do
    name = create(:invoice).name

    get "/api/v1/invoices/find?name=#{name}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["name"]).to eq(name)
  end

  it "can find an invoice by creation date" do
    created_invoice = create(:invoice, created_at: "2017-05-02T03:04:05.000Z")

    get "/api/v1/invoices/find?created_at=#{created_invoice.created_at}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["name"]).to eq(created_invoice.name)
  end

  it "can find an invoice by updated date" do
    updated_invoice = create(:invoice, updated_at: "2017-05-02T03:04:05.000Z")

    get "/api/v1/invoices/find?updated_at=#{updated_invoice.updated_at}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["name"]).to eq(updated_invoice.name)
  end

  it "can find all invoices by name" do
    invoice1 = Invoice.create(name: "Invoice1")
    invoice2 = Invoice.create(name: "Invoice2")
    invoice3 = Invoice.create(name: "Invoice3")

    get "/api/v1/invoices/find_all?name=#{invoice1.name}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice[0]["name"]).to eq("Invoice1")
  end
end
