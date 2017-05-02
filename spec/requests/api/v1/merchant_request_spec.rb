require 'rails_helper'

describe "Merchants API" do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get "/api/v1/merchants"

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
  end
end
