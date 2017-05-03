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

  it "can find a transaction by credit card number" do
    credit_card = create(:transaction).credit_card_number

    get "/api/v1/transactions/find?credit_card_number=#{credit_card}"

    expect(response).to be_success
    
    transaction = JSON.parse(response.body)

    expect(transaction["credit_card_number"]).to eq(credit_card)
  end
end
