require "rails_helper"

describe "Transactions API" do
  it "can send a list of transactions" do
    create_list(:transaction, 3)

    get "/api/v1/transactions"

    expect(response).to be_success

    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(3)

  end

  it "can find transactions by id" do
    id = create(:transaction).id

    get "/api/v1/transactions/#{id}"

    expect(response).to be_success

    transaction = JSON.parse(response.body)

    expect(transaction["id"]).to eq(id)
  end
end
