require 'rails_helper'

describe 'Items API' do
  it "sends a list of invoice items" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, customer: customer, merchant: merchant)
    item = create(:item, merchant: merchant)

    invoice_item = create(:invoice_item, invoice: invoice, item: item)
    
    get '/api/v1/invoice_items'

    expect(response).to be_success

    invoice_items = JSON.parse(response.body)

    expect(invoice_items.count).to eq(1)

  end

  it "can get one invoice item by its id" do
    customer = create(:customer)
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    invoice = create(:invoice, customer: customer, merchant: merchant)
    id = create(:invoice_item, invoice: invoice, item: item).id


    get "/api/v1/invoice_items/#{id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["id"]).to eq(id)
  end

  it "can find a invoice item by name" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, customer: customer, merchant: merchant)
    item1 = create(:item, merchant: merchant)
    invoice_item_1 = create(:invoice_item)
    #
    # create_list(:invoice_item, 3)
    invoice_item = create(:invoice_item, invoice: invoice, item: item1)
    id = invoice_item.id

    get "/api/v1/invoice_items/find?id=#{id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["id"]).to eq(id)
  end

  it "can find an invoice-item by creation date" do
    customer = create(:customer)
    merchant = create(:merchant)

    invoice = create(:invoice, customer: customer, merchant: merchant)
    item1 = create(:item, merchant: merchant)

    invoice_item = create(:invoice_item, invoice: invoice, item: item1)
    created_invoice_item = create(:invoice_item, created_at: "2017-05-02T03:04:05.000Z")


    get "/api/v1/invoice_items/find?created_at=#{created_invoice_item.created_at}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["id"]).to eq(created_invoice_item.id)
  end

  it "can find an invoice-item by updated date" do
    updated_invoice_item = create(:invoice_item, updated_at: "2017-05-02T03:04:05.000Z")

    get "/api/v1/invoice_items/find?updated_at=#{updated_invoice_item.updated_at}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["id"]).to eq(updated_invoice_item.id)
  end

  it "can find all invoice-items by name" do

    customer = create(:customer)
    merchant = create(:merchant)

    invoice = create(:invoice, customer: customer, merchant: merchant)
    item1 = create(:item, merchant: merchant)

    invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id:  invoice.id)
    invoice_item2 = create(:invoice_item, item_id: item1.id, invoice_id: invoice.id)

    get "/api/v1/invoice_items/find_all?id=#{invoice_item1.id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item[0]["id"]).to eq(invoice_item1.id)
  end

  it 'returns a random invoice-item' do
    create_list(:invoice_item, 100)
    get '/api/v1/invoice_items/random'

    invoice_item_1 = JSON.parse(response.body)

    random_invoice_item = InvoiceItem.find(invoice_item_1["id"])

    get '/api/v1/invoice_items/random'

    invoice_item_2 = JSON.parse(response.body)
    random_invoice_item2 = InvoiceItem.find(invoice_item_2["id"])

    expect(invoice_item_1).to_not eq(invoice_item_2)
  end
end
