class SeasonTeam < ActiveRecord::Base
  belongs_to :team
  belongs_to :season

  delegate :name, to: :team, prefix: true
end
