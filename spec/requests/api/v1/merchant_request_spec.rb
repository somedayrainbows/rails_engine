require 'rails_helper'

describe "Merchants API" do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get "/api/v1/merchants"

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
  end

  it "can find a merchant by id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["id"]).to eq(id)
  end

  it "can find a merchant by name" do
    name = create(:merchant).name

    get "/api/v1/merchants/find?name=#{name}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["name"]).to eq(name)

  end
  
  it "finds a merchant by id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["id"]).to eq(id)
  end

  it "finds a merchant by creation date" do
    created_merchant = create(:merchant, created_at: "2017-05-02T03:04:05.000Z")
    
    get "/api/v1/merchants/find?created_at=#{created_merchant.created_at}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["name"]).to eq(created_merchant.name)
  end

  it "finds a merchant by updated date" do
    updated_merchant = create(:merchant, updated_at: "2017-05-02T03:04:05.000Z")

    get "/api/v1/merchants/find?updated_at=#{updated_merchant.updated_at}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["name"]).to eq(updated_merchant.name)
  end

  it "finds all merchants by name" do
    merchant1 = Merchant.create(name: "Merchant1")
    merchant2 = Merchant.create(name: "Merchant2")
    merchant3 = Merchant.create(name: "Merchant3")

    get "/api/v1/merchants/find_all?name=#{merchant1.name}"
    
    expect(response).to be_success

    merchants = JSON.parse(response.body)
    
    expect(merchants[0]["name"]).to eq("Merchant1")
  end

  it "finds all merchants by creation date" do
     merchant1 = Merchant.create(created_at: "2012-05-02T03:04:05.000Z")
     merchant2 = Merchant.create(created_at: "2017-05-02T03:04:05.000Z")
     merchant3 = Merchant.create(created_at: "2017-05-02T03:04:06.000Z")

     get "/api/v1/merchants/find_all?created_at=#{merchant1.created_at}"

     merchants = JSON.parse(response.body)

     expect(response).to be_success
     expect(merchants[0]["name"]).to eq(merchant1.name)
   end

    it "finds all merchants by updated date" do
      merchant1 = Merchant.create(updated_at: "2017-05-02T03:04:05.000Z")
      merchant2 = Merchant.create(updated_at: "2017-05-02T03:04:05.000Z")
      merchant3 = Merchant.create(updated_at: "2017-05-17T03:04:06.000Z")

      get "/api/v1/merchants/find_all?updated_at=#{merchant1.updated_at}"

      merchants = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchants[0]["name"]).to eq(merchant1.name)
    end
end
