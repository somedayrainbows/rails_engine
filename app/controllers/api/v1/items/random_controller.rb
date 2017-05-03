class Api::V1::Items::RandomController < ApplicationController

  def show
    render json: Item.find(Item.pluck(:id).shuffle.first)
  end

end
