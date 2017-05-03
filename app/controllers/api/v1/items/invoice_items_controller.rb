class Api::V1::Items::InvoiceItemsController < ApplicationController

	def index
		item = Item.find(params[:id])
		render json: item.invoice_invoices
	end

end
