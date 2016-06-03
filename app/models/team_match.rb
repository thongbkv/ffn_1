class TeamMatch < ActiveRecord::Base
  belongs_to :team
  belongs_to :match

  delegate :name, to: :team, prefix: true, allow_nil: true
end
