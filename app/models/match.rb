class Match < ActiveRecord::Base
  has_many :bets
  has_many :team_matches
  has_many :posts
  has_many :teams, through: :team_matches
  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence:  true, length: {maximum: 255}

  belongs_to :season
end
