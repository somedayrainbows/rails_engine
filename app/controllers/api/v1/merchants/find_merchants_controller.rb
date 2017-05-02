class Api::V1::Merchants::FindMerchantsController < ApplicationController
  def show
    render json: Merchant.find_by(find_merchant_params)
  end

  def index
    render json: Merchant.where(find_merchant_params)
  end

  private
  def find_merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
