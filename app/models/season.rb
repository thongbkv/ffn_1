class Season < ActiveRecord::Base
  has_many :season_teams
  has_many :matches
  has_many :posts
  has_many :team, through: :season_teams

  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence:  true, length: {maximum: 100}

  def load_matches
    self.matches.group_by &:start_date
  end

  def load_season_team
    self.season_teams.order rank: :desc
  end
end
