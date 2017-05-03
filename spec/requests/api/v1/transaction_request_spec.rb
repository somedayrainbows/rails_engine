require "rails_helper"

describe "Transactions API" do
  it "can send a list of transactions" do
    create_list(:transaction, 3)

    get "/api/v1/transactions"

    expect(response).to be_success

    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(3)

  end
end
