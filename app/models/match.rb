class Match < ActiveRecord::Base
  has_many :bets
  has_many :team_matches, dependent: :destroy
  has_many :teams, through: :team_matches
  has_many :posts
  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 255}

  accepts_nested_attributes_for :team_matches, allow_destroy: true

  belongs_to :season

  def goals
    self.team_matches.map(&:goals).join(" - ")
  end

  def points
    self.team_matches.map{|team_match| team_match.points}.join(" - ")
  end
end
