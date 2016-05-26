class User < ActiveRecord::Base
  has_many :comments
  has_many :replies
  has_many :bets
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :comments
  has_many :replies
  has_many :bets
end
