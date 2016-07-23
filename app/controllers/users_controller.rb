class UsersController < ApplicationController
  def index
    render json: User.order(:id).to_json(except: [:auth_token, :password_digest])
  end

  def show
    if User.exists?(params[:id])
      render json: set_user.to_json(except: [:auth_token, :password_digest])
    else
      render json: { message: "User not found.", status: 404 }
    end
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: { user: user, status: 201 }
    else
      render json: user.errors, status: 422
    end
  end

  def update
    if user = set_user
      if authenticate_ownership?(params[:auth_token], user)
        if user.update(user_params)
          render json: user
        else
          render json: user.errors, status: 422
        end
      else
        render json: { message: "You must be logged in to do that", status: 401 }
      end
    else
      render json: { message: "User does not exist", status: 401 }
    end
  end

  def destroy
    if user = set_user
      if authenticate_ownership?(params[:auth_token], user)
        user.destroy
        render json: { message: "User was successfully deleted." }
      else
        render json: { message: "You must be logged in to do that", status: 401 }
      end
    else
      render json: { message: "User does not exist", status: 401 }
    end
  end

  private
  def set_user
    User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end
end
