class VotesController < ApplicationController
  def index
    render json: Vote.order(:id).to_json
  end

  def show
    if Vote.exists?(params[:id])
      render json: Vote.find(params[:id]).to_json
    else
      render json: { message: "User not found.", status: 404 }
    end
  end

  def create
    authenticate_token?(params[:auth_token])
  end

  def update
    authenticate_token?(params[:auth_token])
  end

  def destroy
    authenticate_token?(params[:auth_token])
  end
end
