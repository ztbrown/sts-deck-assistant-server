class CardsController < ApplicationController

  def index
    respond_to do |format|
      format.json {
        render json: Character.find_by_title(params[:character_title]).cards
      }
    end
  end

  def show
    respond_to do |format|
      format.json {
        render json: Card.find_by_name(params[:name])
      }
    end
  end
end
