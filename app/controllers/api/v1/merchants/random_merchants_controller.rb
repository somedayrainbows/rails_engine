class Api::V1::Merchants::RandomMerchantsController < ApplicationController

  def show
    render json: Merchant.find(Merchant.pluck(:id).shuffle.first)
  end
end
