class PlacesController < ApplicationController
  def index
    render json: Place.order(:id).to_json(include: [:votes, :user], methods: :vote_count)
  end

  def show
    if Place.exists?(params[:id])
      render json: Place.find(params[:id]).to_json(include: :votes, methods: :vote_count)
    else
      render json: { message: 'Place not found', status: 404 }
    end
  end

  def create
    if authenticate_token?(params[:auth_token])
      place = Place.new(place_params)
      if place.save
        render json: { place: place }
      else
        render json: { status: 404 }
      end
    else
      render json: { message: "You must be logged in to do that", status: 401 }
    end
  end

  def update
    place = Place.find(params[:id])
    if place
      if authenticate_ownership?(params[:auth_token], place)
        if place.update(place_params)
          render json: { place: place }
        else
          render json: { status: 404 }
        end
      else
        render json: { message: "You must be logged in to do that", status: 401 }
      end
    else
      render json: { message: "Place does not exist", status: 401 }
    end
  end

  def destroy
    place = Place.find(params[:id])
    if place
      if authenticate_ownership?(params[:auth_token], place)
        Place.destroy(params[:id])
        render json: { message: "Place was successfully deleted" }
      else
        render json: { message: "You must have created this place to delete it", status: 404 }
      end
    else
      render json: { message: "Place does not exist", status: 401 }
    end
  end

  private
  def place_params
    params.require(:place).permit(:title, :address, :imgurl)
  end
end
