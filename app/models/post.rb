class Post < ActiveRecord::Base
  has_many :comments

  belongs_to :season
  belongs_to :match
end
