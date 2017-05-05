require "rails_helper"

describe "Transactions API" do
  it "can send a list of transactions" do
    invoice = create(:invoice)
    transaction1 = create(:transaction, invoice: invoice)
    transaction2 = create(:transaction, invoice: invoice)
    transaction3 = create(:transaction, invoice: invoice)

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

  it "can find all transactions by credit card number" do
    transaction1 = create(:transaction)
    transaction2 = create(:transaction)
    transaction3 = create(:transaction)

    get "/api/v1/transactions/find_all?credit_card_number=#{transaction1.credit_card_number}"

    expect(response).to be_success

    transactions = JSON.parse(response.body)

    expect(transactions[0]["credit_card_number"]).to eq(transaction1.credit_card_number)
  end

  it 'returns a random transaction' do
    create_list(:transaction, 50)

    get '/api/v1/transactions/random'
    
    transaction_1 = JSON.parse(response.body)

    random_transaction = Transaction.find(transaction_1["id"])

    get '/api/v1/transactions/random'

    transaction_2 = JSON.parse(response.body)
    random_transaction2 = Transaction.find(transaction_2["id"])
    expect(transaction_1).to_not eq(transaction_2)
  end
end
