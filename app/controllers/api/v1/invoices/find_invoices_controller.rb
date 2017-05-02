
class Api::V1::Invoices::FindInvoicesController < ApplicationController

  def index
    render json: Invoice.where(find_invoice_params)
  end

  def show
    render json: Invoice.find_by(find_invoice_params)
  end

  private
    def find_invoice_params
      params.permit(:id, :name, :description, :created_at, :updated_at)
    end
end
