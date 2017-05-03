class Api::V1::Transactions::FindTransactionsController < ApplicationController
  def show
    render json: Transaction.find_by(find_transaction_params)
  end
  
  def index
    render json: Transaction.all
  end

  private

  def find_transaction_params
    params.permit(:id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at)
  end
end
