class SessionsController < ApplicationController
  def authenticate
    # Does the authentication process
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params.fetch(:password))
      render json: { auth_token: user.auth_token }
    else
      render json: { message: "Incorrect Email or Password", status: 401 }
    end
  end
end
