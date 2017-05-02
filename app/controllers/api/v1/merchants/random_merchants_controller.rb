class Api::V1::Merchants::RandomMerchantsController < ApplicationController
  
  def show
    @merchant = Merchant.all.shuffle.pop
  end
end
