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
    binding.pry
    if authenticate_token?(params[:auth_token])
      vote = Vote.new(vote_params)
      if vote.save
        render json: { vote: vote }
      else
        render json: { status: 404 }
      end
    else
      render json: { message: "You must be logged in to do that", status: 401 }
    end
  end

  def update
    vote = Vote.find(params[:id])
    if vote
      if authenticate_ownership?(params[:auth_token], vote)
        if vote.update(vote_params)
          render json: { vote: vote }
        else
          render json: { status: 404 }
        end
      else
        render json: { message: "You must be logged in to do that", status: 401 }
      end
    else
      render json: { message: "Vote does not exist", status: 401 }
    end
  end

  def destroy
    vote = Vote.find(params[:id])
    if vote
      if authenticate_ownership?(params[:auth_token], vote)
        Vote.destroy(params[:id])
        render json: { message: "Vote was successfully deleted" }
      else
        render json: { message: "You must have created this vote to delete it", status: 404 }
      end
    else
      render json: { message: "Vote does not exist", status: 401 }
    end
  end

  private
  def vote_params
    params.require(:vote).permit(:place_id, :user_id)
  end
end
