class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :season
  belongs_to :match

  validates :title,  presence: true
  validates :content,  presence: true

  mount_uploader :image, LogoUploader
end
