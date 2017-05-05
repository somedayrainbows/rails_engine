class Api::V1::Transactions::RandomController < ApplicationController
  def show
    render json: Transaction.all.shuffle.pop
  end
end
