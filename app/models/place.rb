class Place < ApplicationRecord
  has_many :votes, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :address, presence: true
  validates :imgurl, presence: true

  def vote_count
    votes.count
  end

  def self.top
    joins("join votes on votes.place_id = places.id")
    .group("places.id, places.title")
    .order("count(votes.id) desc")
  end
end
