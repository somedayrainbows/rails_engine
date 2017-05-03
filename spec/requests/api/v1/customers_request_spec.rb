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
    name = create(:customer).name

    get "/api/v1/customers/find?name=#{name}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["name"]).to eq(name)
  end

  it "can find an customer by creation date" do
    created_customer = create(:customer, created_at: "2017-05-02T03:04:05.000Z")

    get "/api/v1/customers/find?created_at=#{created_customer.created_at}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["name"]).to eq(created_customer.name)
  end

  it "can find a customer by updated date" do
    updated_customer = create(:customer, updated_at: "2017-05-02T03:04:05.000Z")

    get "/api/v1/customers/find?updated_at=#{updated_customer.updated_at}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["name"]).to eq(updated_customer.name)
  end

  it "can find all customers by name" do
    customer1 = Customer.create(name: "Mike")
    customer2 = Customer.create(name: "Mark")
    customer3 = Customer.create(name: "Mindy")

    get "/api/v1/customers/find_all?name=#{customer1.name}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer[0]["name"]).to eq("Mike")
  end

  it 'returns a random customer' do
    create_list(:customer, 100)
		get '/api/v1/customers/random'

		customer_1 = JSON.parse(response.body)

		random_customer = customer.find(customer_1["id"])

		get '/api/v1/customers/random'

		customer_2 = JSON.parse(response.body)
		random_customer2 = Customer.find(customer_2["id"])

		expect(customer_1).to_not eq(customer_2)
  end
end
