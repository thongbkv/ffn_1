class Team < ActiveRecord::Base
  has_many :players
  has_many :season_teams
  has_many :team_matches
  has_many :matches, through: :team_matches
  has_many :seasons, through: :season_teams
end
