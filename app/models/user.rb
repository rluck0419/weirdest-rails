class User < ApplicationRecord
  before_create :set_auth_token

  validates :name, presence: true
  validates :username, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true

  has_secure_password

  private
  def set_auth_token
    if auth_token.nil?
      self.auth_token = SecureRandom.uuid.delete("-")
    end
  end
end
