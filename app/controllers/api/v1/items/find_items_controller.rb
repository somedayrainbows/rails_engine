class Api::V1::Items::FindItemsController < ApplicationController

  def index
    render json: Item.where(find_item_params)
  end

  def show
    render json: Item.find_by(find_item_params)
  end

  private
    def find_item_params
      params.permit(:id, :name, :description, :created_at, :updated_at)
    end
end
