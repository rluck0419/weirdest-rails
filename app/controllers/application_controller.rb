class ApplicationController < ActionController::API
  def authenticate_token?(token)
    User.find_by(auth_token: token)
  end

  def authenticate_ownership?(token, item)
    if user = User.find_by(auth_token: token)
      if item.respond_to? :user_id
        item.user_id == user.id
      else
        item.id == user.id
      end
    end
  end
end
