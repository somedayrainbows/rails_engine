class Api::V1::InvoiceItems::RandomController < ApplicationController

  def show
    render json: InvoiceItem.find(InvoiceItem.pluck(:id).shuffle.first)
  end

end
