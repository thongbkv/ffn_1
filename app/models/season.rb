class Season < ActiveRecord::Base
  has_many :season_teams
  has_many :matches
  has_many :posts
  has_many :team, through: :season_teams 
end
