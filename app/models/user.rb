class User < ActiveRecord::Base
  has_many :comments
  has_many :replies
  has_many :bets
end
