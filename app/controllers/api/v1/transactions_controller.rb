class Api::V1:: TransactionsController < ApplicationRecord
  def index
    render json: Transaction.all
  end

  def show
    render json: Transaction.find(params[:id])
  end
end
