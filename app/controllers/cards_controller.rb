class CardsController < ApplicationController
  def show
    respond_to do |format|
      format.json {
        render json: Card.find_by_name(params[:name])
      }
    end
  end
end
