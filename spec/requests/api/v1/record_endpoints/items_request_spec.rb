require 'rails_helper'


describe 'Items API' do
  it "sends a list of items" do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
  end

  it "can get one item by its id" do

    id = create(:item).id
    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(id)
  end

  it "can find a item by name" do
    name = create(:item).name

    get "/api/v1/items/find?name=#{name}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["name"]).to eq(name)
  end

  it "can find an item by creation date" do
    created_item = create(:item, created_at: "2017-05-02T03:04:05.000Z")

    get "/api/v1/items/find?created_at=#{created_item.created_at}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["name"]).to eq(created_item.name)
  end

  it "can find an item by updated date" do
    updated_item = create(:item, updated_at: "2017-05-02T03:04:05.000Z")

    get "/api/v1/items/find?updated_at=#{updated_item.updated_at}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["name"]).to eq(updated_item.name)
  end

  it "can find all items by name" do
    item1 = create(:item, name: "glove")
    item2 = create(:item, name: "ball")
    item3 = create(:item, name: "bat")

    get "/api/v1/items/find_all?name=#{item1.name}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item[0]["name"]).to eq("glove")
  end

  it 'returns a random item' do
    create_list(:item, 100)

    get '/api/v1/items/random'

    item_1 = JSON.parse(response.body)

    random_item = Item.find(item_1["id"])

    get '/api/v1/items/random'

    item_2 = JSON.parse(response.body)
    random_item2 = Item.find(item_2["id"])

    expect(item_1).to_not eq(item_2)
  end
end
