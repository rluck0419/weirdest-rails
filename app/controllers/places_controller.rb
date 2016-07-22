class PlacesController < ApplicationController
  def index
    render json: { places: Place.order(:id), status: 200 }
  end

  def show
    if Place.exists?(params[:id])
      render json: { place: Place.find(params[:id]) }
    else
      render json: { message: 'Place not found', status: 404 }
    end
  end

  def create
    place = Place.new(place_params)
    if place.save
      render json: { place: place }
    else
      render json: { status: 404 }
    end
  end

  def update
    place = Place.find(params[:id])
    if place.update(place_params)
      render json: { place: place }
    else
      render json: { status: 404 }
    end
  end

  def destroy
    if Place.exists?(params[:id])
      Place.destroy(params[:id])
      render json: { message: "Place was successfully deleted" }
    else
      render json: { status: 404 }
    end
  end

  private
  def place_params
    params.require(:place).permit(:title, :address, :imgurl)
  end
end
