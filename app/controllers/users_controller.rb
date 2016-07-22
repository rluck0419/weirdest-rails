class UsersController < ApplicationController
  def index
    render json: { users: User.order(:id) }
  end

  def show
    if User.exists?(params[:id])
      render json: { user: set_user }
    else
      render json: { message: "User not found.", status: 404 }
    end
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      render json: { user: user, status: 201 }
    else
      render json: user.errors, status: 422
    end
  end

  def update
    user = set_user

    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: 422
    end
  end

  def destroy
    user = set_user
    if user.id == current_user.id
      user.destroy
      render json: { message: "User was successfully deleted." }
    else
      render json: { status: 404 }
    end
  end

  private
  def set_user
    User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :username, :email, :password_digest)
  end
end
