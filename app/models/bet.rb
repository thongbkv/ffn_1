class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :match

  enum status: [:win, :tie, :fail]

  def is_win_of_team? team_id
    self.team_id == team_id
  end
end
