class PlacesController < ApplicationController
  def index
    render json: Place.order(:id).to_json(include: :votes, methods: :vote_count)
  end

  def show
    if Place.exists?(params[:id])
      render json: Place.find(params[:id]).to_json(include: :votes, methods: :vote_count)
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
