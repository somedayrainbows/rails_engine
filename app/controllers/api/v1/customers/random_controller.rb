class Api::V1::Customers::RandomController < ApplicationController

  def show
    render json: Customer.find(Customer.pluck(:id).shuffle.first)
  end

end
