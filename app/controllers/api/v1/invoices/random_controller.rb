class Api::V1::Invoices::RandomController < ApplicationController

  def show
    render json: Invoice.find(Invoice.pluck(:id).shuffle.first)
  end

end
