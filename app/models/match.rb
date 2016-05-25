class Match < ActiveRecord::Base
  has_many :bets
  has_many :team_matches
  has_many :posts
  has_many :teams, through: :team_matches

  belongs_to :season
end
