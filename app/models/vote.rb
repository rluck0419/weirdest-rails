class Vote < ApplicationRecord
  belongs_to :place
  belongs_to :user
  validates :user_id, uniqueness: true
end
