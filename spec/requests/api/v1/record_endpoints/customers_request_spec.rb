require 'rails_helper'

describe "Customers API" do
  it "sends a list of customers" do
    create_list(:customer, 3)

    get '/api/v1/customers'

    expect(response).to be_success

    customers = JSON.parse(response.body)

    expect(customers.count).to eq(3)
  end

  it "can get one customer by its id" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(id)
  end

  it "can find a customer by name" do
    customer1 = create(:customer)

    get "/api/v1/customers/find?last_name=#{customer1.last_name}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["last_name"]).to eq(customer1.last_name)
  end

  it "can find an customer by creation date" do
    created_customer = create(:customer, created_at: "2017-05-02T03:04:05.000Z")

    get "/api/v1/customers/find?created_at=#{created_customer.created_at}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(created_customer.id)
  end

  it "can find a customer by updated date" do
    updated_customer = create(:customer, updated_at: "2017-05-02T03:04:05.000Z")

    get "/api/v1/customers/find?updated_at=#{updated_customer.updated_at}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(updated_customer.id)
  end

  it "can find all customers by name" do
    customers = create_list(:customer, 3)
    get "/api/v1/customers/find_all?last_name=#{customers.first.last_name}"

    customer = JSON.parse(response.body)
    expect(response).to be_success
    expect(customer[0]["last_name"]).to eq(customers.first.last_name)
  end

  it 'returns a random customer' do
    create_list(:customer, 100)
    
    get '/api/v1/customers/random'

    customer_1 = JSON.parse(response.body)

    random_customer = Customer.find(customer_1["id"])

    get '/api/v1/customers/random'

    customer_2 = JSON.parse(response.body)
    random_customer2 = Customer.find(customer_2["id"])
    expect(customer_1["id"]).to_not eq(customer_2["id"])
  end
end
