class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :match

  enum status: [:win, :tie, :fail]
end
