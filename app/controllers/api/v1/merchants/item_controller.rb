class Api::V1::Merchants::ItemsController < ApplicationController

	def show
		merchant = Merchant.find(params[:id])
		render json: merchant.items
	end

end
