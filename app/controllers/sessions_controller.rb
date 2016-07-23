class SessionsController < ApplicationController
  def login
    # Does the authentication process
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params.fetch(:password))
      render json: { auth_token: user.auth_token, name: user.name, username: user.username, email: user.email, id: user.id }
    else
      render json: { message: "Incorrect Email or Password", status: 401 }
    end
  end
end
