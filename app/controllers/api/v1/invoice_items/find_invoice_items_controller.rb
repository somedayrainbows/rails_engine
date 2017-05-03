class Api::V1::InvoiceItems::FindInvoiceItemsController < ApplicationController

  def show
    render json: InvoiceItem.find_by(find_invoice_items_params)
  end

  def index
    render json: InvoiceItem.where(find_invoice_items_params)
  end

  private
    def find_invoice_items_params
      params.permit(:id, :name, :description, :created_at, :updated_at)
    end
end
