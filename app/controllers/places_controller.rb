class PlacesController < ApplicationController
  def index
    render json: { places: Place.all }
  end

  def show
    if Place.exists?(params[:id])
      render json: { place: Place.find(params[:id]) }
    else
      render json: { message: 'Student not found', status: 404 }
    end
  end

  def new
    render json: {
      place: Place.new
    }
  end

  def create
    place = Place.new(place_params)
    if place.save
      redirect_to place
    else
      render :new
    end
  end

  def edit
    render json: {
      place: Place.find(params[:id])
    }
  end

  def update
    place = Place.find(params[:id])
    if place.update(place_params)
      redirect_to place
    else
      render :edit
    end
  end

  def destroy
    if Place.exists?(params[:id])
      Place.destroy(params[:id])
      flash[:notice] = "Place deleted"
      redirect_to places
    else
      flash[:alert] = "There was an error - please try again"
    end
  end

  private
  def place_params
    params.require(:place).permit(:name, :address, :imgurl)
  end
end
