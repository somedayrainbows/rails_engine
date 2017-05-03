require 'rails_helper'

describe 'Items API' do
  it "sends a list of invoice items" do
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items'

    expect(response).to be_success

    invoice_items = JSON.parse(response.body)

    expect(invoice_items.count).to eq(3)

  end

  it "can get one invoice item by its id" do
    id = create(:invoice_item).id

    get "/api/v1/invoice_items/#{id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["id"]).to eq(id)
  end

  it "can find a invoice item by name" do
    name = create(:invoice_item).name

    get "/api/v1/invoice_items/find?name=#{name}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["name"]).to eq(name)
  end

  it "can find an invoice-item by creation date" do
    created_invoice_item = create(:invoice_item, created_at: "2017-05-02T03:04:05.000Z")

    get "/api/v1/invoice_items/find?created_at=#{created_invoice_item.created_at}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["name"]).to eq(created_invoice_item.name)
  end

  it "can find an invoice-item by updated date" do
    updated_invoice_item = create(:invoice_item, updated_at: "2017-05-02T03:04:05.000Z")

    get "/api/v1/invoice_items/find?updated_at=#{updated_invoice_item.updated_at}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["name"]).to eq(updated_invoice_item.name)
  end

  it "can find all invoice-items by name" do
    invoice_item1 = InvoiceItem.create(name: "glove")
    invoice_item2 = InvoiceItem.create(name: "ball")
    invoice_item3 = InvoiceItem.create(name: "bat")

    get "/api/v1/invoice_items/find_all?name=#{invoice_item1.name}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item[0]["name"]).to eq("glove")
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
