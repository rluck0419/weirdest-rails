class ApplicationController < ActionController::API
  def current_user
    User.find_by(id: session[:user_id])
  end

  def user_logged_in?
    current_user.present?
  end

  def authenticate_user!
    unless user_logged_in?
      render json: { message: "You must be logged in to do that", status: 401}
    end
  end
end
